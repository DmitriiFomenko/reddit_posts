import 'package:flutter/material.dart';

class BodyPost extends StatelessWidget {
  const BodyPost({
    Key? key,
    required this.title,
    this.urlImage,
  }) : super(key: key);

  final String title;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8.0,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (urlImage != null) ...[
          Image.network(urlImage!),
        ],
      ],
    );
  }
}
