import 'package:crm_app/app/utils/widgets/custom_btn.dart';
import 'package:crm_app/app/utils/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class CustomSearchAdd extends StatelessWidget {
  const CustomSearchAdd({super.key, this.onSearch, this.onAdd, this.btnTxt});
  final void Function(String val)? onSearch;
  final void Function()? onAdd;
  final String? btnTxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Flexible(child: CustomSearch(onChanged: onSearch)),
        CustomBtn(txt: btnTxt ?? "", height: 48, width: 150, action: onAdd),
      ],
    );
  }
}
