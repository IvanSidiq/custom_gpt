import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomToast {
  static void showToastError(String message) {
    Fluttertoast.showToast(
      msg: message.capitalized,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showToastSuccess(String message) {
    Fluttertoast.showToast(
      msg: message.capitalized,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFF266ED1),
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
