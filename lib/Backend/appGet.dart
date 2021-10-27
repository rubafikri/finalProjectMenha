import 'package:get/get.dart';

class AppGet extends GetxController {
  final data = <String, dynamic>{}.obs;
  final publiclist = [].obs;
  final publicbool = true.obs;
  var advertorinfluance = 2.obs;
  var messgcount = 0.obs;
  var notificationcount = 0.obs;
  int advertorinfluancelogin = 0;
  final useridsobs = ''.obs;
  final tokenuser = ''.obs;
  final usertype = ''.obs;
  final emails = ''.obs;
  final fcmtokenstor = ''.obs;
  static AppGet get to => Get.find<AppGet>();

  @override
  void onInit() {
    super.onInit();
  }

  setuserids(String userobs) {
    useridsobs(userobs);
  }
}
