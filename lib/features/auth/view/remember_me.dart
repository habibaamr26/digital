import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_styles.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0xFF5890FF),
            ),

            child: Image(image: AssetImage("assets/images/Vector.png"))),
        const SizedBox(width: 6,),
        Text(
          'Remember me',
          style: AppStyles.styleRegular14(context),
        ),
        const Spacer(),
        Text(
          'Forgot the password?',
          style: AppStyles.styleRegular14(context).copyWith(color: Color(0xFF5890FF)),
        ),
      ],
    );
  }
}
