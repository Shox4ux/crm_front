// import 'package:crm_app/app/features/common/functions/show_toast.dart';
// import 'package:crm_app/app/features/common/widget/custom_btn.dart';
// import 'package:crm_app/app/features/common/widget/custom_progress.dart';
// import 'package:crm_app/app/features/common/widget/custom_search.dart';
// import 'package:crm_app/app/features/common/widget/custom_title.dart';
// import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit/warehouse_cubit.dart';
// import 'package:crm_app/app/features/warehouse/presentation/widgets/ware_card.dart';
// import 'package:flutter/material.dart';

// class WareProList extends StatelessWidget {
//   const WareProList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(40),
//       child: Column(
//         spacing: 30,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomTitle(title: "Warehouse"),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 spacing: 10,
//                 children: [
//                   CustomSearch(onChanged: _search),
//                   CustomBtn(onPress: showAddWarehouseDialog, txt: "Add"),
//                 ],
//               ),
//             ],
//           ),
//           Flexible(
//             child: BlocConsumer<WarehouseCubit, WarehouseState>(
//               listener: (context, state) {
//                 if (state.status == WareStatus.success) {}
//                 if (state.status == WareStatus.failure) {
//                   showToast(context, state.msg ?? "");
//                 }
//               },
//               builder: (context, state) {
//                 if (state.status == WareStatus.getall) {
//                   return CustomLoading();
//                 }
//                 var list = context.watch<WarehouseCubit>().getFiltList();
//                 return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 5,
//                     crossAxisSpacing: 30,
//                     mainAxisSpacing: 30,
//                   ),
//                   shrinkWrap: true,
//                   itemCount: list.length,
//                   itemBuilder: (_, i) => WareCard(item: list[i]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
