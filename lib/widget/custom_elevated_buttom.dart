import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.color,
    required this.text,
    this.textColor = Colors.black,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String text;
  final Color? textColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(width: 0.8, color: Colors.grey),
        ),
        backgroundColor: color ?? AppColor.blackColor,
        minimumSize: const Size(double.infinity, 56),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
