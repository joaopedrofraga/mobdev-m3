import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const TextFormFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(controller: controller);
  }
}
