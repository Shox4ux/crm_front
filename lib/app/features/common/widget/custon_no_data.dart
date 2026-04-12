import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.dataNotFound,
        style: AppTxtStl.medium.copyWith(fontSize: 20),
      ),
    );
  }
}
