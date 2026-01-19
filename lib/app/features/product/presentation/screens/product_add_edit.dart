import 'dart:io';
import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/form_empty_validation.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/product/data/model/product_create.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/presentation/bloc/product_cubit.dart';
import 'package:crm_app/app/features/product/presentation/data/product_changes.dart';
import 'package:crm_app/app/features/product/presentation/widget/add_edit_expense_dialog.dart';
import 'package:crm_app/app/features/product/presentation/widget/custom_exp_table.dart';
import 'package:crm_app/app/features/product/presentation/widget/img_file_holder.dart';
import 'package:crm_app/app/features/product/presentation/widget/img_url_holder.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:crm_app/app/utils/img_handler/img_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:crm_app/app/utils/utils.dart';

class ProductAddEdit extends StatefulWidget {
  const ProductAddEdit({super.key, this.isEdit = false, this.product});
  final bool isEdit;
  final ProductEntity? product;

  @override
  State<ProductAddEdit> createState() => _ProductAddEditState();
}

class _ProductAddEditState extends State<ProductAddEdit> {
  File? _image;
  final picker = ImagePicker();
  MultipartFile? img;
  String? _initialUrl;
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController(text: "1");
  final TextEditingController sellPriceCtrl = TextEditingController();
  final TextEditingController profitMarginCtrl = TextEditingController();
  final TextEditingController expName = TextEditingController();
  final TextEditingController expAmount = TextEditingController();
  late final GlobalKey<FormState> globalKey;

  List<Map<String, dynamic>> expenses = [];

  void detectProdChange(ProductCubit cubit) {
    if (quantityCtrl.text != widget.product?.totalQuantity.toString()) {
      cubit.setChanges(
        cubit.state.changes.setQty(int.tryParse(quantityCtrl.text) ?? 1),
      );
    }
    if (getBasePrice() != widget.product?.basePrice) {
      cubit.setChanges(cubit.state.changes.setBasePrice(getBasePrice()));
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
    for (var oldExp in widget.product!.baseExpenses!) {
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
        var old = widget.product!.baseExpenses!.firstWhere((e) => e.id == id);
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
    final picked = await ImageHelper.imageHandler();
    if (picked != null) {
      _image = await ImageHelper.compressAndSave(File(picked.path));
      setState(() {
        img = MultipartFile.fromFileSync(
          _image!.path,
          filename: basename(_image!.path),
        );
        nullImgUrl();
      });
    }
  }

  double getBasePrice() {
    double sum = widget.product?.basePrice ?? 0;
    for (var e in expenses) {
      sum += (double.tryParse(e['amount'] ?? '0') ?? 0);
    }
    int qty = int.tryParse(quantityCtrl.text) ?? 1;
    if (qty <= 0) qty = 1;
    double end = sum / qty;
    double truncated = (end * 100).floor() / 100;
    setState(() {});
    return truncated;
  }

  void updateSellPriceFromPercentage(String? val) {
    double basePrice = getBasePrice();
    double percent = double.tryParse(profitMarginCtrl.text) ?? 0;
    double price = basePrice + basePrice * (percent / 100);
    sellPriceCtrl.text = price.toStringAsFixed(2);
  }

  void updatePercentageFromSellPrice(String? val) {
    double basePrice = getBasePrice();
    double sell = double.tryParse(sellPriceCtrl.text) ?? 0;
    double percent = ((sell - basePrice) / basePrice) * 100;
    profitMarginCtrl.text = percent.toStringAsFixed(2);
  }

  void prefillCtrlText() {
    nameCtrl.text = widget.product!.name;
    quantityCtrl.text = widget.product!.totalQuantity.toString();
    sellPriceCtrl.text = widget.product!.sellPrice.toString();
  }

  void prefillPercentage() {
    if (widget.product!.basePrice != 0) {
      double percent =
          ((widget.product!.sellPrice - widget.product!.basePrice) /
          widget.product!.basePrice *
          100);
      profitMarginCtrl.text = percent.toStringAsFixed(2);
    }
  }

  void prefillExpenseList() {
    var list = widget.product!.baseExpenses;
    final mapped = list?.map((e) {
      return {"id": e.id, "name": e.name, "amount": e.amount.toString()};
    }).toList();
    expenses.addAll(mapped ?? []);
  }

  void setImgUrl() => _initialUrl = widget.product?.imgUrl;
  void nullImgUrl() => _initialUrl = null;

  void createProduct(ProductCubit cubit) {
    if (globalKey.currentState!.validate()) {
      var b = ProductCreate(
        img: img,
        name: nameCtrl.text,
        sellPrice: double.tryParse(sellPriceCtrl.text) ?? 0,
        basePrice: getBasePrice(),
        totalQuantity: int.tryParse(quantityCtrl.text) ?? 0,
      );
      var items = expenses
          .map(
            (v) => ExpenseCreate(
              amount: double.tryParse(v['amount']) ?? 0,
              name: v['name'],
            ),
          )
          .toList();
      cubit.createProduct(body: b, exps: items);
    }
  }

  void updateProduct(ProductCubit cubit) {
    detectProdChange(cubit);
    detectRemovedExp(cubit);
    detectUpdated(cubit);
    detectNew(cubit);
    cubit.updateProduct(id: widget.product!.id);
  }

  void removeExp(BuildContext context, String name) {
    showDelConfrm(
      ctx: context,
      action: () {
        setState(() {
          expenses.removeWhere((m) => m['name'] == name);
          updateSellPriceFromPercentage("");
          context.pop();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();

    globalKey = GlobalKey<FormState>(debugLabel: 'screen_key');
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
    profitMarginCtrl.dispose();
    expName.dispose();
    expAmount.dispose();
    super.dispose();
  }

  void _addExpense(BuildContext ctx) => setState(() {
    expenses.add({"name": expName.text, "amount": expAmount.text});
    expAmount.clear();
    expName.clear();
    updateSellPriceFromPercentage("");
    updatePercentageFromSellPrice("");
    goBack(ctx);
  });

  void showAddEditDialog(BuildContext ctx) => addEditExpense(
    ctx: ctx,
    action: () => _addExpense(ctx),
    name: expName,
    amount: expAmount,
    i: -1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Product')),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              CustomTitle(title: "Product Info"),
              BorderedContainer(
                borderRadius: AppRadius.buttonRadius,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: (_initialUrl != null && widget.isEdit)
                          ? ImageUrlHolder(
                              onTap: pickImage,
                              url: _initialUrl!.fullUrl(),
                            )
                          : ImageFileHolder(
                              onTap: pickImage,
                              image: _image,
                              isEdit: widget.isEdit,
                            ),
                    ),
                    Column(
                      spacing: 30,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: globalKey,
                          child: Row(
                            spacing: 60,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  CustomForm(
                                    ctrl: nameCtrl,
                                    valid: validateNotEmpty,
                                    txt: "Product Name",
                                  ),
                                  CustomForm(
                                    isDigit: true,
                                    ctrl: quantityCtrl,
                                    valid: validateNotEmpty,
                                    txt: "Quantity",
                                    onChanged: (v) =>
                                        updateSellPriceFromPercentage(""),
                                  ),
                                  Text(
                                    "Base Price: \$ ${getBasePrice().toString()}",
                                    style: AppTxtStl.medium.copyWith(
                                      fontSize: 24,
                                      color: AppColour.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                spacing: 20,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  CustomForm(
                                    isDigit: true,
                                    ctrl: sellPriceCtrl,
                                    valid: validateNotEmpty,
                                    txt: "Sell Price",
                                    prefix: "\$ ",
                                    onChanged: (v) =>
                                        updatePercentageFromSellPrice(""),
                                  ),
                                  CustomForm(
                                    prefix: "% ",
                                    isDigit: true,
                                    ctrl: profitMarginCtrl,
                                    valid: validateNotEmpty,
                                    txt: "Profit Margin",
                                    onChanged: (v) =>
                                        updateSellPriceFromPercentage(""),
                                  ),
                                  BlocConsumer<ProductCubit, ProductState>(
                                    listener: (context, state) {
                                      if (state.status == ProdStatus.success) {
                                        goBack(context);
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state.status == ProdStatus.loading) {
                                        return const CustomLoading();
                                      }
                                      return CustomBtn(
                                        txt: widget.isEdit ? "Edit" : "Create",
                                        action: () => widget.isEdit
                                            ? updateProduct(
                                                context.read<ProductCubit>(),
                                              )
                                            : createProduct(
                                                context.read<ProductCubit>(),
                                              ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTitle(title: "Product Expenses"),
                  CustomBtn(
                    txt: "Add Expense",
                    action: () => showAddEditDialog(context),
                  ),
                ],
              ),
              CustomExpTable(
                onRemoveExp: (i) => removeExp(context, expenses[i]['name']),
                columns: ["Number", "Expense Name", "Spent Amount", "Action"],
                rows: expenses,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
