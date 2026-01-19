import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/ui/extensions/capitilize.dart';
import 'package:crm_app/app/features/common/widget/img_error.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/presentation/bloc/product_cubit.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.data});
  final ProductEntity data;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void delete() {
    if (mounted) {
      context.read<ProductCubit>().deleteProduct(id: widget.data.id);
      goBack(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: AppRadius.cardRadius),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            color: AppColour.backgroundLight,
            child: Image.network(
              widget.data.imgUrl.fullUrl(),
              height: 200,
              width: double.maxFinite,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child; // IMAGE LOADED
                }
                return OnImgError(height: 200); // LOADING PLACEHOLDER
              },
              errorBuilder: (c, e, s) => OnImgError(height: 200),
            ),
          ),
          BorderedContainer(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                      widget.data.name.capitalize(),
                      style: AppTxtStl.medium.copyWith(
                        fontSize: 18,
                        color: AppColour.backgroundLight,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("\$ ${widget.data.sellPrice}"),
                        Text("${widget.data.totalQuantity} units"),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: AppColour.textFieldBgDark,
                  child: IconButton(
                    onPressed: () {
                      showDelConfrm(
                        ctx: context,
                        action: () =>
                            showDelConfrm(ctx: context, action: delete),
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
