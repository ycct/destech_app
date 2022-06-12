import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../utils/alert_enum.dart';

class CustomSnackBar {
  CustomSnackBar.showSuccessMessage(BuildContext context) {
    const AlertEnum alertEnum = AlertEnum.success;
    context.scaffold.showSnackBar(customSnackBar(alertEnum));
  }

  CustomSnackBar.showErrorMessage(BuildContext context) {
    const AlertEnum alertEnum = AlertEnum.danger;
    context.scaffold.showSnackBar(customSnackBar(alertEnum));
  }

  CustomSnackBar.showWarningMessage(BuildContext context) {
    const AlertEnum alertEnum = AlertEnum.warning;
    context.scaffold.showSnackBar(
      customSnackBar(alertEnum),
    );
  }

  SnackBar customSnackBar(AlertEnum alertEnum) {
    SnackBar snackBar = SnackBar(
      content: Text(
        alertEnum.titleText,
        style: TextStyle(color: alertEnum.textColor),
      ),
      backgroundColor: alertEnum.backgroundColor,
    );
    return snackBar;
  }
}
