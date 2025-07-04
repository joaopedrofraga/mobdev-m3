import 'package:flutter/material.dart';
import 'package:mobdev_m3/controller/app_colors.dart';
import 'package:mobdev_m3/view/text_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final Widget? preffixIcon;
  final int? maxLines;
  final bool? readOnly;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.preffixIcon,
    this.maxLines,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      cursorColor: AppColors.whiteColor,
      maxLines: maxLines,
      style: TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
        label: TextWidget.normal(label),
        prefixIcon: preffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: ' $hintText',
        hintStyle: TextStyle(
          fontSize: 14,
          color: const Color.fromARGB(71, 255, 255, 255),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
