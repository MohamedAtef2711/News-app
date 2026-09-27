import 'package:flutter/material.dart';

class ImageNews extends StatelessWidget {
  const ImageNews({super.key, this.height = 200, required this.image});

  final String image;
  final double height;

  static const String fallbackImage =
      "https://media.radaronline.com/brand-img/cSJdT1h0C/1200x628/jesse-watters-chinese-president-xi-jinping-donald-trumps-state-dinner-5-1790443148831.jpg";

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            fallbackImage,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: height,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
