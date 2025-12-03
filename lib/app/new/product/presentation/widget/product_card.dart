import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/common/widget/img_error.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/new/product/data/fake_data.dart';
import 'package:flutter/material.dart';

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
            child: Image.network(
              item.imgUrl,
              errorBuilder: (c, e, s) => OnImgError(height: 200),
            ),
          ),
          BorderedContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(item.name),
                    Text("\$ " + item.finalPrice.toString()),
                    TextButton(onPressed: () {}, child: Text("Edit")),
                  ],
                ),
                Text(item.quantity.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
