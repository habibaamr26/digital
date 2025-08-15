

import 'package:flutter/material.dart';

import '../widget/text_form_field.dart';

class PasswordField extends StatelessWidget {
  final appCubit;
  const PasswordField({super.key, this.appCubit});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      keyboardType: TextInputType.visiblePassword,
      controller: appCubit.passwordController,
      suffixIcon: Icons.visibility_off_outlined,
      prefixIcon: null,
      obscureText: true,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "enter password please";
        }
        return null;
      },
      label: '',);
  }
}
