import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/ui/extensions/capitilize.dart';
import 'package:crm_app/app/features/common/widget/img_error.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/product/data/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});
  final ProdData item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: AppRadius.cardRadius),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            color: AppColour.backgroundLight,
            child: Image.network(
              item.imgUrl,
              errorBuilder: (c, e, s) => OnImgError(height: 196),
            ),
          ),
          BorderedContainer(
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.only(
              bottomLeft: AppRadius.customRadius,
              bottomRight: AppRadius.customRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name.capitalize(),
                      style: AppTextStyle.medium.copyWith(
                        fontSize: 18,
                        color: AppColour.backgroundLight,
                      ),
                    ),
                    Text("\$ " + item.finalPrice.toString()),
                    Text(item.quantity.toString() + " units"),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: AppColour.textFieldBgDark,
                  child: IconButton(
                    onPressed: () {
                      showDelConfrm(
                        ctx: context,
                        onDel: () {
                          print("object");
                        },
                      );
                    },
                    icon: SvgPicture.asset(AppAssets.delete),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
