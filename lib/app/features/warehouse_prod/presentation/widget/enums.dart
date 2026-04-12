/* ===================== ENUM & HELPERS ===================== */

import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

enum WpFilterStatus {
  all(color: AppColour.textDark),
  coming(color: AppColour.completedDark),
  exists(color: AppColour.rejectedDark);

  final Color color;
  const WpFilterStatus({required this.color});

  String localizedName(BuildContext context) {
    switch (this) {
      case WpFilterStatus.all:
        return context.l10n.all;
      case WpFilterStatus.coming:
        return context.l10n.comingProduct;
      case WpFilterStatus.exists:
        return context.l10n.existsProduct;
    }
  }
}

enum ProductStatus {
  coming(AppColour.rejectedDark),
  exists(AppColour.completedDark);

  final Color color;
  const ProductStatus(this.color);
}

ProductStatus wpStatusFromInt(int? value) {
  switch (value) {
    case 0:
      return ProductStatus.coming;
    case 1:
      return ProductStatus.exists;
    default:
      return ProductStatus.coming;
  }
}

class StatusItem extends StatelessWidget {
  const StatusItem({super.key, required this.status});
  final ProductStatus status;

  @override
  Widget build(BuildContext context) {
    final statusText = _getLocalizedStatus(context, status);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: status.color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(statusText),
      ],
    );
  }

  String _getLocalizedStatus(BuildContext context, ProductStatus status) {
    switch (status) {
      case ProductStatus.coming:
        return context.l10n.comingProduct;
      case ProductStatus.exists:
        return context.l10n.existsProduct;
    }
  }
}
