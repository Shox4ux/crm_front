import 'package:crm_app/app/features/common/widget/img_error.dart';
import 'package:flutter/material.dart';

class ImageUrlHolder extends StatelessWidget {
  const ImageUrlHolder({super.key, required this.onTap, required this.url});
  final void Function() onTap;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child; // IMAGE LOADED
                }
                return OnImgError(); // LOADING PLACEHOLDER
              },
              url,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => OnImgError(),
            ),
          ),
        ),
        ElevatedButton(onPressed: onTap, child: Text("Change image")),
      ],
    );
  }
}
