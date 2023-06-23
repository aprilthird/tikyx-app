import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uikit/colors/colors.dart';

class ToastHelpers {
  static showPrimary(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      timeInSecForIosWeb: 1,
      webBgColor: UIKitColors.webPrimary,
      backgroundColor: UIKitColors.primary,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }

  static showSuccess(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      timeInSecForIosWeb: 1,
      webBgColor: UIKitColors.webSuccess,
      backgroundColor: UIKitColors.success,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }

  static showError(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      timeInSecForIosWeb: 1,
      webBgColor: UIKitColors.webError,
      backgroundColor: UIKitColors.error,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }

  static showWarning(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      timeInSecForIosWeb: 1,
      webBgColor: UIKitColors.webWarning,
      backgroundColor: UIKitColors.warning,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}
