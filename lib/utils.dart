import 'package:flutter/material.dart';

//color
const kPrimaryColor = Color.fromRGBO(214, 48, 49, 1.0);
const kLightColor = Color.fromRGBO(99, 110, 114, 1.0);
const kGreenColor = Color.fromRGBO(0, 184, 148, 1.0);
const kWhiteColor = Colors.white;

//font
class PrimaryFont {
  static String font = 'Roboto';

  static TextStyle thin(double size) {
    return TextStyle(
        fontFamily: font, fontWeight: FontWeight.w100, fontSize: size);
  }

  static TextStyle light(double size) {
    return TextStyle(
        fontFamily: font, fontWeight: FontWeight.w300, fontSize: size);
  }

  static TextStyle regular(double size) {
    return TextStyle(
        fontFamily: font, fontWeight: FontWeight.w400, fontSize: size);
  }

  static TextStyle medium(double size) {
    return TextStyle(
        fontFamily: font, fontWeight: FontWeight.w500, fontSize: size);
  }

  static TextStyle bold(double size) {
    return TextStyle(
        fontFamily: font, fontWeight: FontWeight.w700, fontSize: size);
  }
}

//extension
extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}

//Dialog
class CustomDialog {
  static makeDialog(
      {required BuildContext context,
      required String title,
      required String content,
      List<Widget>? actions}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: actions,
            ));
  }
}
