import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:men7a/drawerScr/aboutApp.dart';
import 'package:men7a/services/services.dart';
import '../signin/signin.dart';
import '../Backend/firebasebackend.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

class DrawerScr extends StatefulWidget {
  DrawerScr({Key? key}) : super(key: key);

  @override
  _DrawerScrState createState() => _DrawerScrState();
}

class _DrawerScrState extends State<DrawerScr> {
  String _platformVersion = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserFromFirestore(userId: mytoken);
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: EdgeInsets.only(top: 64.h),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 33.h),
              child: Text(
                appGet.data['name'].toString(),
                // 'username'.tr,
                // username.toString(),
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
            InkWell(
              onTap: () {
                FlutterOpenWhatsapp.sendSingleMessage("+972592219710", "");
              },
              child: Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      'contactUs'.tr,
                      style:
                          TextStyle(fontSize: 14.sp, color: Colors.grey[900]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: InkWell(
                onTap: () {
                  Get.to(() => AboutAppScr());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      'aboutUs'.tr,
                      style:
                          TextStyle(fontSize: 14.sp, color: Colors.grey[900]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    size: 30,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Text(
                    'share'.tr,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[900]),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  InkWell(
                    onTap: () {
                      kiltoken();
                      appGet.data.clear();
                      Get.to(() => Signin());
                    },
                    child: Text(
                      'logout'.tr,
                      style:
                          TextStyle(fontSize: 14.sp, color: Colors.grey[900]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
