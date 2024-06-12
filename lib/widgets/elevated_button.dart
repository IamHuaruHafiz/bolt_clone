import 'package:flutter/material.dart';

class ElevateButton extends StatelessWidget {
  const ElevateButton({
    super.key,
    this.onpressed,
    required this.text,
    required this.bgColor,
    required this.fgColor,
    required this.width,
  });
  final Function()? onpressed;
  final String text;
  final Color bgColor;
  final Color fgColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: bgColor,
          foregroundColor: fgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: fgColor),
            ),
          ],
        ),
      ),
    );
  }
}
