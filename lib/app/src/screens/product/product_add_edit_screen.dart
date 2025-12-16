import 'dart:io';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/screens/product/data/add_edit_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/logic/product_cubit/product_cubit.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:crm_app/app/utils/utils.dart';

class ProductAddEditScreen extends StatefulWidget {
  const ProductAddEditScreen({super.key, this.isEdit = false, this.product});
  final bool isEdit;
  final ProductRead? product;

  @override
  State<ProductAddEditScreen> createState() => _ProductAddEditScreenState();
}

class _ProductAddEditScreenState extends State<ProductAddEditScreen> {
  File? _image;
  final picker = ImagePicker();
  MultipartFile? img;
  String? _initialUrl = null;
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController(text: "1");
  final TextEditingController sellPriceCtrl = TextEditingController();
  final TextEditingController percentageCtrl = TextEditingController();

  List<Map<String, dynamic>> expenses = [];

  void detectProdChange(ProductCubit cubit) {
    if (quantityCtrl.text != widget.product?.total_quantity.toString()) {
      cubit.setChanges(
        cubit.state.changes.setQty(int.tryParse(quantityCtrl.text) ?? 1),
      );
    }
    if (basePrice != widget.product?.basePrice) {
      cubit.setChanges(cubit.state.changes.setBasePrice(basePrice));
    }
    if (nameCtrl.text != widget.product?.name) {
      cubit.setChanges(cubit.state.changes.setName(nameCtrl.text));
    }
    if (sellPriceCtrl.text != widget.product?.sellPrice.toString()) {
      cubit.setChanges(
        cubit.state.changes.setSellPrice(double.parse(sellPriceCtrl.text)),
      );
    }
    if (_image != null) {
      cubit.setChanges(cubit.state.changes.setImage(img));
    }
  }

  void detectRemovedExp(ProductCubit cubit) {
    List<int> deleted = [];
    for (var oldExp in widget.product!.base_expenses!) {
      bool stillExists = expenses.any((e) => e['id'] == oldExp.id);
      if (!stillExists) deleted.add(oldExp.id);
    }
    if (deleted.isNotEmpty) {
      cubit.setChanges(cubit.state.changes.setDeletedList(deleted));
    }
  }

  void detectNew(ProductCubit cubit) {
    List<NewExpItem> created = [];
    for (var exp in expenses) {
      if (!exp.containsKey('id')) {
        created.add(
          NewExpItem(
            name: exp['name'],
            amount: double.tryParse(exp['amount']) ?? 1,
          ),
        );
      }
    }
    if (created.isNotEmpty) {
      cubit.setChanges(
        cubit.state.changes.setNewList(widget.product!.id, created),
      );
    }
  }

  void detectUpdated(ProductCubit cubit) {
    List<ProdItemUp> updated = [];
    for (var exp in expenses) {
      var id = exp['id'];
      if (id != null) {
        var old = widget.product!.base_expenses!.firstWhere((e) => e.id == id);
        if (exp['name'] != old.name || exp['amount'] != old.amount.toString()) {
          updated.add(
            ProdItemUp(
              id: id,
              name: exp['name'],
              amount: double.tryParse(exp['amount']),
            ),
          );
        }
      }
    }
    if (updated.isNotEmpty) {
      cubit.setChanges(cubit.state.changes.setUpdatedList(updated));
    }
  }

  Future pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
        img = MultipartFile.fromFileSync(
          picked.path,
          filename: basename(picked.path),
        );
        nullImgUrl();
      });
    }
  }

  double get basePrice {
    double sum = 0;
    for (var e in expenses) {
      sum += (double.tryParse(e['amount'] ?? '0') ?? 0);
    }
    int qty = int.tryParse(quantityCtrl.text) ?? 1;
    if (qty <= 0) qty = 1;
    double end = sum / qty;
    double truncated = (end * 100).floor() / 100;
    return truncated;
  }

  void updateSellPriceFromPercentage(String? val) {
    double percent = double.tryParse(percentageCtrl.text) ?? 0;
    double price = basePrice + basePrice * (percent / 100);
    sellPriceCtrl.text = price.toStringAsFixed(2);
  }

  void updatePercentageFromSellPrice(String? val) {
    double sell = double.tryParse(sellPriceCtrl.text) ?? 0;
    double percent = ((sell - basePrice) / basePrice) * 100;
    percentageCtrl.text = percent.toStringAsFixed(2);
  }

  void prefillCtrlText() {
    nameCtrl.text = widget.product!.name;
    quantityCtrl.text = widget.product!.total_quantity.toString();
    sellPriceCtrl.text = widget.product!.sellPrice.toString();
  }

  void prefillPercentage() {
    if (widget.product!.basePrice != 0) {
      double percent =
          ((widget.product!.sellPrice - widget.product!.basePrice) /
          widget.product!.basePrice *
          100);
      percentageCtrl.text = percent.toStringAsFixed(2);
    }
  }

  void prefillExpenseList() {
    final expenseList = widget.product!.base_expenses
        ?.map(
          (e) => {"id": e.id, "name": e.name, "amount": e.amount.toString()},
        )
        .toList();

    expenses.addAll(expenseList ?? []);
  }

  void setImgUrl() => _initialUrl = widget.product?.imgUrl;
  void nullImgUrl() => _initialUrl = null;

  void createProduct(ProductCubit cubit) {
    var b = ProductWrite(
      img: img,
      name: nameCtrl.text,
      sellPrice: double.tryParse(sellPriceCtrl.text) ?? 0,
      basePrice: basePrice,
      totalQuantity: int.tryParse(quantityCtrl.text) ?? 0,
      activeQuantity: int.tryParse(quantityCtrl.text) ?? 0,
    );
    var items = expenses
        .map(
          (v) => ProductExpenseWrite(
            amount: double.tryParse(v['amount']) ?? 0,
            name: v['name'],
          ),
        )
        .toList();
    cubit.createProduct(body: b, exps: items);
  }

  void updateProduct(ProductCubit cubit) {
    detectProdChange(cubit);
    print("0");

    detectRemovedExp(cubit);
    print("2");

    detectUpdated(cubit);
    print("1");
    detectNew(cubit);
    print("10");

    cubit.updateProduct(id: widget.product!.id).then((v) {
      if (cubit.state.changes.isNotEmpty()) {
        cubit.updateBulkExp();
      }
    });
  }

  void showDeleteDialog(BuildContext context, void Function() action) async {
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(onPressed: () => context.pop(), child: const Text("No")),
            ElevatedButton(onPressed: action, child: const Text("Yes")),
          ],
        );
      },
    );
  }

  void removeExp(BuildContext context, String name) {
    showDeleteDialog(context, () {
      setState(() {
        expenses.removeWhere((m) => m['name'] == name);
        print(expenses);
        updateSellPriceFromPercentage("");
        context.pop();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.product != null && widget.isEdit) {
      prefillCtrlText();
      prefillPercentage();
      prefillExpenseList();
      setImgUrl();
    }
  }

  @override
  void dispose() {
    sellPriceCtrl.dispose();
    quantityCtrl.dispose();
    nameCtrl.dispose();
    percentageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                (_initialUrl != null && widget.isEdit)
                    ? ImageUrlHolder(onTap: pickImage, url: _initialUrl!)
                    : ImageFileHolder(
                        onTap: pickImage,
                        image: _image,
                        isEdit: widget.isEdit,
                      ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: nameCtrl,
                        decoration: const InputDecoration(
                          labelText: "Product Name",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: quantityCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Quantity",
                        ),
                        onChanged: (_) => setState(() {
                          updateSellPriceFromPercentage("");
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              expenses.add({"name": "", "amount": ""});
                            });
                          },
                          child: const Text("Add Expense"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          key: ValueKey(expenses[i]['name']),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: expenses[i]['name'],
                                  decoration: const InputDecoration(
                                    labelText: "Name",
                                  ),
                                  onChanged: (v) => expenses[i]['name'] = v,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextFormField(
                                  initialValue: expenses[i]['amount'],
                                  decoration: const InputDecoration(
                                    labelText: "Amount",
                                    prefixText: "\$",
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (v) => setState(() {
                                    expenses[i]['amount'] = v;
                                    updateSellPriceFromPercentage("");
                                  }),
                                ),
                              ),
                              CustomIbtn(
                                onPress: () =>
                                    removeExp(context, expenses[i]['name']),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade200,
              child: Text(
                "Base Price: \$ ${basePrice.toString()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sellPriceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Sell Price",
                      prefixText: "\$",
                    ),

                    onChanged: updatePercentageFromSellPrice,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: percentageCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Percentage %",
                    ),
                    onChanged: updateSellPriceFromPercentage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state.status == ProdStatus.success) {
                  context.pop();
                }
              },
              builder: (context, state) {
                if (state.status == ProdStatus.loading) {
                  return CustomLoading();
                }
                return widget.isEdit
                    ? CustomBtn(
                        txt: "Update",
                        onPressed: () {
                          updateProduct(context.read<ProductCubit>());
                        },
                      )
                    : CustomBtn(
                        txt: "Create",
                        onPressed: () =>
                            createProduct(context.read<ProductCubit>()),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageUrlHolder extends StatelessWidget {
  const ImageUrlHolder({super.key, required this.onTap, required this.url});
  final void Function() onTap;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url.fullUrl(),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => OnImgError(),
            ),
          ),
        ),
        ElevatedButton(onPressed: onTap, child: Text("Change image")),
      ],
    );
  }
}

class ImageFileHolder extends StatelessWidget {
  const ImageFileHolder({
    super.key,
    required this.onTap,
    this.image,
    this.isEdit = false,
  });
  final void Function() onTap;

  final File? image;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEdit ? null : onTap,
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: image == null
                ? const Icon(Icons.add, size: 40)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(image!, fit: BoxFit.cover),
                  ),
          ),
          if (isEdit)
            ElevatedButton(onPressed: onTap, child: Text("Change image")),
        ],
      ),
    );
  }
}
