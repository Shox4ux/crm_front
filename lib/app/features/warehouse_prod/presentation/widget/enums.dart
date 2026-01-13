/* ===================== ENUM & HELPERS ===================== */

import 'package:flutter/material.dart';

enum ProductStatus {
  pending(Colors.orange),
  sold(Colors.green),
  cancelled(Colors.red);

  final Color color;
  const ProductStatus(this.color);
}

ProductStatus statusFromInt(int? value) {
  switch (value) {
    case 0:
      return ProductStatus.pending;
    case 1:
      return ProductStatus.sold;
    case 2:
      return ProductStatus.cancelled;
    default:
      return ProductStatus.pending;
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
