import 'package:crm_app/app/features/client/data/model/client_product_response.dart';
import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/user/data/model/user_response.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:crm_app/app/utils/funcs/profit_percent.dart';
import 'package:crm_app/app/utils/widgets/custom_double_text.dart';
import 'package:crm_app/app/utils/widgets/custom_ibtn.dart';
import 'package:crm_app/app/utils/widgets/custom_field.dart';
import 'package:crm_app/app/utils/widgets/img_error.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product, this.cp, this.user});
  final ProductResponse product;
  final ClientProductResponse? cp;
  final UserResponse? user;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late TextEditingController _cpCtrl;

  @override
  void initState() {
    super.initState();
    _cpCtrl = TextEditingController(text: widget.cp?.customPrice.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _cpCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prod = widget.product;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print("object");
            context.push('/product_add_edit', extra: prod);
          },
          child: Card(
            margin: EdgeInsets.only(right: 23, bottom: 20),
            clipBehavior: Clip.hardEdge,
            color: Colors.white,
            elevation: 8,

            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      errorBuilder: (_, e, s) => OnImgError(),
                      prod.imgUrl.fullUrl(),
                      width: double.maxFinite,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Flexible(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDoubleText(ttl: "Name: ", b: prod.name),
                        CustomDoubleText(
                          isNum: true,
                          ttl: "Buy Price: ",
                          b: prod.basePrice.toString(),
                        ),
                        widget.cp != null
                            ? CustomDoubleText(
                                isNum: true,
                                ttl: "Custom Price: ",
                                b: widget.cp?.customPrice.toString() ?? "",
                              )
                            : CustomDoubleText(
                                isNum: true,
                                ttl: "Sell Price: ",
                                b: prod.sellPrice.toString(),
                              ),
                        CustomDoubleText(
                          ttl: "Quantity: ",
                          b: prod.totalQuantity.toString(),
                        ),
                        CustomDoubleText(
                          isPrc: true,
                          ttl: "Profit: ",
                          b: profitPrc(prod.basePrice, prod.sellPrice),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 23,
          child: CustomIbtn(
            onPress: () {
              // context.read<ProductCubit>().deleteProduct(id: widget.product.id);
            },
          ),
        ),
      ],
    );
  }
}

showCPchange(
  BuildContext c,
  void Function() onChanged,
  TextEditingController ctrl,
) {
  return showDialog<bool>(
    context: c,
    builder: (context) => AlertDialog(
      title: Center(child: const Text("Edit Custom Price")),
      content: CustomField(ctrl: ctrl, isMoney: true, width: 300, height: 60),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(onPressed: onChanged, child: const Text("Confirm")),
        ElevatedButton(
          onPressed: () {
            ctrl.clear();
            context.pop();
          },
          child: const Text("Cancel"),
        ),
      ],
    ),
  );
}
