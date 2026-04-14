import 'dart:io';
import 'package:crm_app/actions/action_widgets/enter_action.dart';
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
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
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
import 'package:crm_app/app/utils/funcs/file_handler.dart';
import 'package:crm_app/app/utils/funcs/img_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  void createMultipart() {
    if (_image == null) return;
    img = MultipartFile.fromFileSync(
      _image!.path,
      filename: basename(_image!.path),
    );
    nullImgUrl();
  }

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
            amount: double.tryParse(exp['amount'].toString()) ?? 1,
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

  void detectUpdatedExp(ProductCubit cubit) {
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
              amount: double.tryParse(exp['amount'].toString()),
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
    try {
      final picked = await FileHelper.fileHandler();
      if (picked != null) {
        _image = await ImageHelper.compressAndSave(picked);
        if (widget.isEdit) {
          _initialUrl = null;
          createMultipart();
        }
        setState(() {});
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  // FIXED: Consistent base price calculation
  double getBasePrice() {
    double totalExpense = 0;
    for (var e in expenses) {
      totalExpense += (double.tryParse(e['amount'].toString()) ?? 0);
    }

    int qty = int.tryParse(quantityCtrl.text) ?? 1;
    if (qty <= 0) qty = 1;

    double result = totalExpense / qty;
    return double.parse(result.toStringAsFixed(2));
  }

  // FIXED: Logic for Margin -> Sell Price
  void updateSellPriceFromPercentage(String? val) {
    double base = getBasePrice();
    double margin = double.tryParse(profitMarginCtrl.text) ?? 0;
    double price = base * (1 + (margin / 100));

    setState(() {
      sellPriceCtrl.text = price.toStringAsFixed(2);
    });
  }

  // FIXED: Logic for Sell Price -> Margin
  void updatePercentageFromSellPrice(String? val) {
    double base = getBasePrice();
    double sell = double.tryParse(sellPriceCtrl.text) ?? 0;

    if (base <= 0) return;

    double percent = ((sell - base) / base) * 100;

    setState(() {
      profitMarginCtrl.text = percent.toStringAsFixed(2);
    });
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
      createMultipart();
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
              amount: double.tryParse(v['amount'].toString()) ?? 0,
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
    detectUpdatedExp(cubit);
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
    goBack(ctx);
  });

  void showAddEditDialog(BuildContext ctx) => addEditExpense(
    ctx: ctx,
    action: () => _addExpense(ctx),
    name: expName,
    amount: expAmount,
    i: -1,
  );

  void addEditAction(ProductCubit cubit) =>
      widget.isEdit ? updateProduct(cubit) : createProduct(cubit);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.createProduct)),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              CustomTitle(title: context.l10n.productInfo),
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
                                    txt: context.l10n.productName,
                                  ),
                                  CustomForm(
                                    isDigit: true,
                                    ctrl: quantityCtrl,
                                    valid: validateNotEmpty,
                                    txt: context.l10n.quantity,
                                    onChanged: (v) {
                                      // Recalculate everything when quantity changes
                                      updateSellPriceFromPercentage("");
                                    },
                                  ),
                                  Text(
                                    "${context.l10n.basePrice}: \$ ${getBasePrice().toString()}",
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
                                    txt: context.l10n.sellPrice,
                                    prefix: "\$ ",
                                    onChanged: updatePercentageFromSellPrice,
                                  ),
                                  CustomForm(
                                    prefix: "% ",
                                    isDigit: true,
                                    ctrl: profitMarginCtrl,
                                    valid: validateNotEmpty,
                                    txt: context.l10n.profitMargin,
                                    onChanged: updateSellPriceFromPercentage,
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
                                      return EnterAction(
                                        onEnter: () => addEditAction(
                                          context.read<ProductCubit>(),
                                        ),
                                        child: CustomBtn(
                                          txt: widget.isEdit
                                              ? context.l10n.edit
                                              : context.l10n.create,
                                          action: () => addEditAction(
                                            context.read<ProductCubit>(),
                                          ),
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
                  CustomTitle(title: context.l10n.productExpenses),
                  CustomBtn(
                    txt: context.l10n.expenseName,
                    action: () => showAddEditDialog(context),
                  ),
                ],
              ),
              CustomExpTable(
                onRemoveExp: (i) => removeExp(context, expenses[i]['name']),
                columns: [
                  context.l10n.number,
                  context.l10n.expenseName,
                  context.l10n.spentAmount,
                  context.l10n.action,
                ],
                rows: expenses,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
