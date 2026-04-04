/* ===================== ENUM & HELPERS ===================== */

import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

enum WpFilterStatus {
  all(color: AppColour.textDark),
  coming(color: AppColour.completedDark),
  exists(color: AppColour.rejectedDark);

  final Color color;
  const WpFilterStatus({required this.color});
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
        Text(status.name),
      ],
    );
  }
}
