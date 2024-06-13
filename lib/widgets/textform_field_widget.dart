// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rydeme/components/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.labelText,
    this.showTrailIcon,
    this.isFilled = true,
    this.showPrefixIcon,
    this.prefixIcon,
    this.trailingIcon,
    this.hintText,
  });
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? showTrailIcon;
  final bool? showPrefixIcon;
  final bool isFilled;
  final IconData? prefixIcon;
  final IconData? trailingIcon;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.showPrefixIcon == true
            ? Icon(
                widget.prefixIcon,
                size: 40,
              )
            : null,
        suffixIcon: widget.showTrailIcon == true
            ? IconButton(
                onPressed: () {
                  widget.controller.clear();
                },
                icon: Icon(
                  widget.trailingIcon,
                  size: 40,
                ),
              )
            : null,
        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.grey.shade400,
            ),
        hintText: widget.hintText,
        label: widget.labelText != null ? Text(widget.labelText!) : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        fillColor: AppColors.grey.shade200,
        filled: widget.isFilled,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: widget.isFilled
              ? BorderSide.none
              : BorderSide(color: AppColors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary)),
      ),
    );
  }
}
