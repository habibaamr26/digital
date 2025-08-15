import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleBold24(context) {
    return TextStyle(
      fontSize: 24,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      letterSpacing: 0.12
    );
  }
  static TextStyle styleBold48(context) {
    return TextStyle(
        fontSize: 48,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        letterSpacing: 0.12
    );
  }
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(

      fontSize: 16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
        letterSpacing: 0.12
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
        letterSpacing: 0.12
    );
  }
  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        letterSpacing: 0.12
    );
  }



  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
        letterSpacing: 0.12
    );
  }
  static TextStyle styleRegular24(BuildContext context) {
    return TextStyle(
        fontSize: 24,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.12
    );
  }
  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(

        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.12
    );
  }
}
