
import 'package:flutter/material.dart';

import '../../../core/utils/app_styles.dart';

class FixedData extends StatelessWidget {
  const FixedData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage("assets/images/logo.png")),
            Image(image: AssetImage("assets/images/Frame.png")),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 42, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest",
                style: AppStyles.styleSemiBold16(context)
                    .copyWith(color: Colors.black),
              ),
              Text("See all", style: AppStyles.styleRegular14(context)),
            ],
          ),
        ),
      ],
    );
  }
}
