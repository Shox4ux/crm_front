import 'package:crm_app/app/features/common/functions/retry_dialog.dart';
import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/product/presentation/bloc/product_cubit.dart';
import 'package:crm_app/app/features/product/presentation/widget/product_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  void _search(String? query) {
    setState(() {
      context.read<ProductCubit>().filter(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(title: "Products"),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  CustomSearch(onChanged: _search),
                  CustomBtn(
                    onPress: () => context.push(Routes.productAddEdit),
                    txt: "Add",
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state.status == ProdStatus.retriable &&
                    state.retry != null) {
                  showRetryDialog(
                    context: context,
                    message: state.msg,
                    onRetry: state.retry!,
                  );
                }

                if (state.status == ProdStatus.error) {
                  showToast(context, state.msg);
                }
              },
              builder: (context, state) {
                if (state.status == ProdStatus.loading) {
                  return CustomLoading();
                }
                if (state.status == ProdStatus.empty ||
                    state.status == ProdStatus.error) {
                  return NoData();
                }
                var list = context.watch<ProductCubit>().getFiltList();
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, i) => GestureDetector(
                    onTap: () {
                      context.push(Routes.productAddEdit, extra: list[i]);
                    },
                    child: ProductCard(data: list[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
