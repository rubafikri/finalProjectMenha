import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:men7a/kfalatToggle/accepted.dart';
import 'package:men7a/kfalatToggle/waiting.dart';

class KfalatScr extends StatefulWidget {
  KfalatScr({Key? key}) : super(key: key);

  @override
  _KfalatScrState createState() => _KfalatScrState();
}

class _KfalatScrState extends State<KfalatScr> {
  bool pressed1 = true;
  bool pressed2 = false;
  int scrno = 1;
  getScreen(int scr) {
    if (scr == 1) {
      return AcceptedScr();
    }
    if (scr == 2) {
      return WaitingScr();
    }
  }

  @override
  void initState() {
    getScreen(scrno);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    pressed1 = false;
                    pressed2 = true;
                    scrno = 2;
                  });
                },
                child: Container(
                  width: 180.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    color: HexColor('#2B468B'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 14.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: pressed2
                              ? AssetImage('assets/images/bell1.png')
                              : AssetImage('assets/images/bell2.png'),
                        ),
                        Text('waitStu'.tr,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: pressed2
                                    ? Colors.white
                                    : Colors.grey[400])),
                        Container(
                          width: 180.w,
                          height: 2.h,
                          color: pressed2 ? Colors.white : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    pressed1 = true;
                    pressed2 = false;
                    scrno = 1;
                  });
                },
                child: Container(
                  width: 180.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    color: HexColor('#2B468B'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 14.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: pressed1
                              ? AssetImage('assets/images/bell1.png')
                              : AssetImage('assets/images/bell2.png'),
                        ),
                        Text('acceptStu'.tr,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: pressed1
                                    ? Colors.white
                                    : Colors.grey[400])),
                        Container(
                          width: 180.w,
                          height: 2.h,
                          color: pressed1 ? Colors.white : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Container(
              height: 1000.h,
              child: getScreen(scrno),
            ),
          ),
        ],
      ),
    ));
  }
}
