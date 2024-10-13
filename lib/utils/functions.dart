import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../components/custom_navbar.dart';
import '../constants/colors.dart';
import 'size_config.dart';

Future push(BuildContext context, Widget widget, {bool? routes}) =>
    routes == null
        ? Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          )
        : Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => widget),
            (route) => routes,
          );

Future buildCustomAlertDialog(
  BuildContext context, {
  required Widget child,
  bool barrierDismissible = false,
}) {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        );
      });
}

Future<bool?> yesOrNoDialog(
  context, {
  String title = "Confirmation",
  String message = "Êtes-vous sûr de vouloir continuer",
  GestureTapCallback? accept,
  GestureTapCallback? cancel,
}) async {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            title,
            maxLines: 2,
            style: const TextStyle(
              color: kBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -.5,
            ),
          ),
          const VerticalSpacing(),
          AutoSizeText(
            message,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          const VerticalSpacing(),
          CustomNavbar(accept: () => Navigator.pop(context, true)),
        ],
      ),
    ),
  );
}

Future showModalBottomSheet_(context, Widget widget) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: widget,
      );
    },
  );
}
