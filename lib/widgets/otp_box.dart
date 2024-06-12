import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydeme/components/colors.dart';

class OTPBox extends StatelessWidget {
  const OTPBox({
    super.key,
    required this.first,
    required this.last,
    required this.controller,
  });
  final bool first, last;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (val) {
            if (val.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (val.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: 2,
                  ))),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
