import 'dart:io';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/funcs/show_toast.dart';
import 'package:crm_app/app/utils/img_handler/img_handler.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:crm_app/app/utils/widgets/custom_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

showAddProductDialog(
  BuildContext context, {
  required TextEditingController nameCtrl,
  required TextEditingController buyPriceCtrl,
  required TextEditingController sellPriceCtrl,
}) async {
  await showDialog(
    context: context,
    builder: (_) {
      String? imgPath;
      File? slctImg;

      Uint8List? imageBytes;
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(child: const Text("Add Product")),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    final file = await ImageHelper.pickImage();
                    if (file != null) {
                      imageBytes = await file.readAsBytes();
                      setState(() {
                        imgPath = file.path;
                        slctImg = File(file.path);
                      });
                    }
                  },
                  child: Container(
                    width: 310,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    clipBehavior: Clip.hardEdge,
                    child: kIsWeb
                        ? imageBytes != null
                              ? Image.memory(fit: BoxFit.cover, imageBytes!)
                              : Text("Select Image")
                        : imgPath != null
                        ? Image.file(
                            slctImg!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : Text("Select Image"),
                  ),
                ),
                SizedBox(height: 10),

                CustomField(
                  isDense: false,
                  ctrl: nameCtrl,
                  hint: "Product name",
                  width: 320,
                  height: 60,
                ),
                CustomField(
                  isDense: false,
                  isMoney: true,
                  ctrl: buyPriceCtrl,
                  hint: "Buy price",
                  width: 320,
                  height: 60,
                ),
                CustomField(
                  isDense: false,
                  isMoney: true,
                  ctrl: sellPriceCtrl,
                  hint: "Sell price",
                  width: 320,
                  height: 60,
                ),
              ],
            );
          },
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          CustomBtn(
            width: 120,
            txt: "Confirm",
            onPressed: () {
              if (imgPath == "") return;

              // context.read<ProductCubit>().createProduct(
              //   body: ProductWrite(
              //     img: img,
              //     name: nameCtrl.text,
              //     buyPice: double.tryParse(buyPriceCtrl.text) ?? 0,
              //     sellPice: double.tryParse(sellPriceCtrl.text) ?? 0,
              //   ),
              // );

              //Clear the left data
              nameCtrl.clear();
              buyPriceCtrl.clear();
              sellPriceCtrl.clear();
              imgPath = null;
              imageBytes = null;
              context.pop();
            },
          ),
          CustomBtn(
            width: 120,
            txt: "Cancel",
            onPressed: () {
              //Clear the left data

              nameCtrl.clear();
              buyPriceCtrl.clear();
              sellPriceCtrl.clear();
              imgPath = null;
              imageBytes = null;
              context.pop();
            },
          ),
        ],
      );
    },
  );
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _sellPriceCtrl;
  late TextEditingController _buyPriceCtrl;
  late String imagePath;

  @override
  void initState() {
    _nameCtrl = TextEditingController();
    _buyPriceCtrl = TextEditingController();
    _sellPriceCtrl = TextEditingController();
    imagePath = "";
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _buyPriceCtrl.dispose();
    _sellPriceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          spacing: 20,
          children: [
            CustomSearchAdd(
              onSearch: (val) {
                setState(() {
                  context.read<ProductCubit>().filter(val);
                });
              },
              btnTxt: "Add Product",
              onAdd: () => context.push("/product_add_edit"),
            ),

            Flexible(
              child: BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state.status == ProdStatus.error) {
                    showToast(context, state.msg);
                    context.read<ProductCubit>().neutralState();
                  }
                },
                builder: (context, state) {
                  if (state.status == ProdStatus.loading) {
                    return CustomLoading();
                  }
                  if (state.status == ProdStatus.disconnected) {
                    return RetryWidget(
                      message: state.msg,
                      onRetry: () {
                        context.read<ProductCubit>().getAllProduct();
                      },
                    );
                  }

                  var list = context.watch<ProductCubit>().getFiltList();
                  if (list.isEmpty) return NoData();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 0.9,
                        ),
                    itemCount: list.length,

                    itemBuilder: (_, int i) => ProductCard(product: list[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
