import 'package:awesome_snackbar_content/src/default_colors.dart';
import 'package:flutter/cupertino.dart';

class ContentType {
  final String message;
  final Color? color;
  ContentType(this.message, [this.color]);

  static ContentType help = ContentType('help', DefaultColors.helpBlue);
  static ContentType failure = ContentType('failure', DefaultColors.failureRed);
  static ContentType success =
      ContentType('success', DefaultColors.successGreen);
  static ContentType warning =
      ContentType('warning', DefaultColors.warningYellow);
}
