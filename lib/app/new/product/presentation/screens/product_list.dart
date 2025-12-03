import 'package:crm_app/app/new/common/widget/custom_title.dart';
import 'package:crm_app/app/new/product/data/fake_data.dart';
import 'package:crm_app/app/new/product/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(title: "Products"),
              TextButton(onPressed: () {}, child: Text("Add")),
            ],
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 40,
              childAspectRatio: 250 / 140,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: prodList.length,
            itemBuilder: (_, i) => ProductCard(item: prodList[i]),
          ),
        ],
      ),
    );
  }
}
