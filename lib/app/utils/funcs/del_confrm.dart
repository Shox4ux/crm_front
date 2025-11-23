import 'package:flutter/material.dart';

showDelConfrm(BuildContext context, void Function() onDel) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Confirm Delete"),
      content: const Text("Are you sure to delete this item?"),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(onPressed: onDel, child: const Text("Delete")),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    ),
  );
}
