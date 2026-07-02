import 'package:flutter/material.dart';

class IllustrationWidget extends StatelessWidget {
  final String imagePath;
  final double height;

  const IllustrationWidget({Key? key, required this.imagePath, this.height = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}