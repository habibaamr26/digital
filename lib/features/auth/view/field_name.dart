
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../core/utils/app_styles.dart';

Widget FieldName({
  required String label,
  required context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label, // username
              style: AppStyles.styleRegular14(context).copyWith(color: Colors.black),
            ),
            TextSpan(
                text: '*', // *
                style:AppStyles.styleRegular14(context).copyWith(color: Colors.red)
            ),
          ],
        ),
      ),
      const SizedBox(height: 4),
    ],
  );
}





