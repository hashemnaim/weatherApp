
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ToastType {
  SUCCESS,
  DANGER,
  WARNING,
}

enum ToastPosition { top, bottom }

showToast(String title, String message, ToastType type) {
  Get.snackbar(
    title,
    message,
    backgroundColor: const Color(0xFFFFFFFF),
    backgroundGradient: type == ToastType.SUCCESS
        ? const LinearGradient(colors: [
            Color(0xFF76b852),
            Color(0xFF8DC26F),
          ])
        : type == ToastType.DANGER
            ? const LinearGradient(colors: [
                Color(0xFFf85032),
                Color(0xFFe73827),
              ])
            : type == ToastType.WARNING
                ? const LinearGradient(colors: [
                    Color(0xFFff9966),
                    Color(0xFFffcc00),
                  ])
                : const LinearGradient(colors: [
                    Color(0xFF47A9FF),
                    Color(0xFF70C4CD),
                  ]),
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    icon: Icon(
      type == ToastType.SUCCESS
          ? EvaIcons.checkmarkCircle2Outline
          : type == ToastType.DANGER
              ? EvaIcons.alertTriangleOutline
              : type == ToastType.WARNING
                  ? EvaIcons.alertTriangleOutline
                  : EvaIcons.infoOutline,
      color: Colors.white
    )
  );
}
