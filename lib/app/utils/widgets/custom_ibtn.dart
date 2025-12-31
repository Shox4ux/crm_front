import 'package:flutter/material.dart';

class CustomIbtn extends StatelessWidget {
  const CustomIbtn({super.key, required this.onPress, this.isEdit = false});
  final void Function() onPress;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: isEdit
          ? Icon(Icons.edit, color: Colors.blue)
          : Icon(Icons.delete, color: Colors.red),
    );
  }
}
