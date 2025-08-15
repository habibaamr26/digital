
import 'package:flutter/material.dart';

import '../widget/text_form_field.dart';

class UserNameField extends StatelessWidget {
  final appCubit;
  const UserNameField({super.key, this.appCubit});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      keyboardType: TextInputType.emailAddress,
      controller: appCubit.usernameController,
      prefixIcon: null,
      // change color based on error
      borderSide: appCubit.hasError
          ? 0xFFC30052
          : 0xFF4E4B66,
      suffixIcon: appCubit.hasError ? Icons.close : null,
      suffixColor: 0xFFC30052,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Enter your email please";
        }
        // Validate email input
        String pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value.trim())) {
          appCubit.changeBorderColor();
          return "Invalid Username";
        }
        return null;
      },
      label: '',);
  }
}
