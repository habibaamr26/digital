import 'package:digitalhub/core/cubit/app_cubit.dart';
import 'package:digitalhub/core/cubit/app_status.dart';
import 'package:digitalhub/features/auth/view/password_dield_widget.dart';
import 'package:digitalhub/features/auth/view/remember_me.dart';
import 'package:digitalhub/features/auth/view/signup_prom.dart';
import 'package:digitalhub/core/widgets/social_button.dart';
import 'package:digitalhub/features/auth/view/username_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_styles.dart';

import 'field_name.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AppCubit, AppState>(
            builder: (BuildContext context, state) {
              AppCubit appCubit = context.read<AppCubit>();
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                child: Form(
                  key: appCubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Hello Text
                      Text('Hello', style: AppStyles.styleBold48(context)),
                      Text(
                        'Again!',
                        style: AppStyles.styleBold48(context)
                            .copyWith(color: const Color(0xFF1877F2)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Welcome back you\'ve\nbeen missed',
                        style: AppStyles.styleRegular20(context),
                      ),
                      const SizedBox(height: 48),
                      // Username Field
                      FieldName(
                        label: 'Username',
                        context: context,
                      ),
                      const SizedBox(height: 4),
                      UserNameField(appCubit: appCubit,),
                      const SizedBox(height: 16),
                      // Password Field
                      FieldName(
                        label: 'password', context: context,
                      ),
                      const SizedBox(height: 4),
                      PasswordField(appCubit:appCubit),
                      const SizedBox(height: 8),
                      // Remember Me and Forgot Password Row
                      RememberMe(),
                      const SizedBox(height: 16),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: SocialButton(
                          text: 'Login',
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            if (appCubit.formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, "mainScreen");
                              appCubit.fetchTopHeadlines();
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Or continue with
                      Center(
                        child: Text(
                          'or continue with',
                          style: AppStyles.styleRegular14(context),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Social Login Buttons
                      Row(
                        children: [
                          SocialButton(
                            text: 'Facebook',
                            backgroundColor: Color(0xFFEEF1F4),
                            textColor: Color(0xFF667080),
                            onPressed: () {},
                            image: 'assets/images/facebook.png',
                          ),
                          const SizedBox(width: 31),
                          SocialButton(
                            text: 'Google',
                            backgroundColor: Color(0xFFEEF1F4),
                            textColor: Color(0xFF667080),
                            onPressed: () {},
                            image: 'assets/images/google.png',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SignUpPrompt(
                        promptText: "Don't have an account?",
                        actionText: "Sign Up",
                      ),
                    ],
                  ),
                ),
              );
            },

          ),
        ),
      ),
    );
  }
}


