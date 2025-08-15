


import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String label;
  late bool obscureText;
  final void Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final int borderSide;
  final int suffixColor;
  TextFieldWidget({super.key,
    required this.keyboardType,
    required this.controller,
    required this.label,
    this.onPressed,
    this.obscureText=false,
    this.suffixIcon,
    required this.prefixIcon,
    required this.validator,
    this.borderSide=0xFF4E4B66,
    this.suffixColor=0xFF4E4B66
  });



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color:Color(borderSide) )
        ),

        prefixIcon:Icon(prefixIcon),
        suffixIcon: IconButton(onPressed: onPressed,
          icon: Icon(suffixIcon != null?suffixIcon:null,color: Color(suffixColor),),),
      ),
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: validator,
    );
  }

}
