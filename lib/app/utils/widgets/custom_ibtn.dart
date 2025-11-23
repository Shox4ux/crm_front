import 'package:flutter/material.dart';

class CustomIbtn extends StatelessWidget {
  const CustomIbtn({super.key, required this.onPress, this.isCP = false});
  final void Function() onPress;
  final bool isCP;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: isCP
          ? Icon(Icons.edit, color: Colors.blue)
          : Icon(Icons.delete, color: Colors.red),
    );
  }
}
