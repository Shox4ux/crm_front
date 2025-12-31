import 'dart:io';

import 'package:flutter/material.dart';

class ImageFileHolder extends StatelessWidget {
  const ImageFileHolder({
    super.key,
    required this.onTap,
    this.image,
    this.isEdit = false,
  });
  final void Function() onTap;

  final File? image;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEdit ? null : onTap,
      child: Column(
        spacing: 20,
        children: [
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: image == null
                ? const Icon(Icons.add, size: 40)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(image!, fit: BoxFit.cover),
                  ),
          ),
          if (isEdit)
            ElevatedButton(onPressed: onTap, child: Text("Change image")),
        ],
      ),
    );
  }
}
