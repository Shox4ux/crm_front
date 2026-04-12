import 'package:flutter/material.dart';

class RefresherWidget extends StatelessWidget {
  const RefresherWidget({
    super.key,
    required this.child,
    this.onRefresh,
    this.right = 60,
    this.bottom = 60,
  });
  final Widget child;
  final void Function()? onRefresh;
  final double right;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: bottom,
          right: right,
          child: FloatingActionButton(
            onPressed: onRefresh,
            child: const Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}
