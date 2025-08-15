
import 'package:flutter/material.dart';
import '../../../core/utils/app_styles.dart';

class SignUpPrompt extends StatelessWidget {
  final String promptText;
  final String actionText;

  const SignUpPrompt({
    Key? key,
    required this.promptText, required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          promptText,
          style: AppStyles.styleSemiBold14(context)
        ),
        //const SizedBox(width: 5),
        GestureDetector(
          onTap: (){},
          child: Text(
            actionText,
            style: AppStyles.styleSemiBold14(context).copyWith(color:Colors.blue )
          ),
        ),
      ],
    );
  }
}
