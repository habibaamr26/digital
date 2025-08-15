
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
//reusable button
class SocialButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String? image; // خليتها nullable

  const SocialButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null) ...[
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(image!),
            ),
            const SizedBox(width: 10), // Gap بين الأيقونة والنص
          ],
          Text(
            text,
            style: AppStyles.styleSemiBold16(context).copyWith(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
