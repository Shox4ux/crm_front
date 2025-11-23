import 'package:crm_app/app/src/data/remote/models/response/client/client_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/user/user_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:crm_app/app/utils/widgets/custom_double_text.dart';
import 'package:crm_app/app/utils/widgets/custom_ibtn.dart';
import 'package:crm_app/app/utils/widgets/custom_field.dart';
import 'package:crm_app/app/utils/widgets/img_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product, this.cp, this.user});
  final ProductRead product;
  final ClientProductRead? cp;
  final UserRead? user;

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
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print("object");
            context.push('/product_add_edit', extra: widget.product);
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
                      widget.product.imgUrl.fullUrl(),
                      width: double.maxFinite,
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDoubleText(ttl: "Name: ", b: widget.product.name),
                      CustomDoubleText(
                        isNum: true,
                        ttl: "Buy Price: ",
                        b: widget.product.basePrice.toString(),
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
                              b: widget.product.sellPrice.toString(),
                            ),
                    ],
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
              context.read<ProductCubit>().deleteProduct(id: widget.product.id);
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
