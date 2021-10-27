import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomDialougs {
  CustomDialougs._();
  static CustomDialougs utils = CustomDialougs._();
  showDialoug({String? titleKey, String? messageKey}) {
    Get.defaultDialog(
        confirm: CupertinoButton(
            child: Text('Ok'),
            onPressed: () {
              Get.back();
            }),
        middleText: messageKey!.tr,
        title: titleKey!.tr);
  }

  showSackbar({String? titleKey, String? messageKey}) {
    Get.snackbar(
      titleKey!.tr,
      messageKey!.tr,
      duration: Duration(seconds: 3),
    );
  }
}
