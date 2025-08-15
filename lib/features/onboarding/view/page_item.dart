
import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_styles.dart';
import '../model/onbording_model.dart';

Widget pageItem({
  required context,
  required OnBordingModel bording,
  required double screenHeight,
  required double screenWidth,
}) {
  return Column(

    children: [
      // Responsive Image Container
      SizedBox(
        height: screenHeight * 0.6,
        width: double.infinity,
        child: Image.asset(
          bording.image,
          fit: BoxFit.cover,
        ),
      ),

      // Flexible space for text content
      Flexible(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Column(
            children: [
              // Title
              Text(
                bording.name,
                style: AppStyles.styleBold24(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.01),
              // Subtitle
              Text(
                bording.titel,
                style:  AppStyles.styleRegular16(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}