import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAlert(BuildContext context,
    {required String title,
      required String message,
      required bool isError,
      bool? isWarning,
      String? warningTitle,
      Function? onOkPress,
      Widget? body,
      TextStyle? messTextStyle,
      String? btnOkText,
      void Function(DismissType)? onDismissCallback}) {
  return AwesomeDialog(
    body: body,
    context: context,
    dismissOnTouchOutside: true,
    onDismissCallback: onDismissCallback,
    dialogType: isError
        ? DialogType.error
        : isWarning != null && isWarning == true
        ? DialogType.warning
        : DialogType.success,
    borderSide: const BorderSide(color: Colors.grey, width: 2),
    width: MediaQuery.of(context).size.width,
    buttonsBorderRadius: BorderRadius.circular(5),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title:
    isWarning != null && isWarning == true ? warningTitle ?? title : title,
    descTextStyle: messTextStyle ?? Styles.textStyle16.copyWith(
      fontWeight: FontWeight.w500,
    ),
    desc: message,
    btnOkText: btnOkText ?? 'Ok',
    buttonsTextStyle: Styles.textStyle14.copyWith(color: kWhiteColor),
    btnOkColor: isError
        ? kErrorColor
        : isWarning != null && isWarning == true
        ? kWarningColor
        : kSuccessColor,
    btnOkOnPress: () async {
      onOkPress?.call();
    },
  )..show();
}