import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goBack(BuildContext context) {
  final router = GoRouter.of(context);
  if (router.canPop()) {
    router.pop();
  }
}
