import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:men7a/cards/inMenhaCard.dart';
import 'package:men7a/cards/mainCard.dart';
import 'package:men7a/drawerScr/drawerScr.dart';
import 'package:men7a/extraScreens/outmenhaDetails.dart';
import 'package:men7a/services/services.dart';

import 'KfalaSign.dart';
import 'insideMenha.dart';
import 'outmenha.dart';

class Mainscr extends StatefulWidget {
  Mainscr({Key? key}) : super(key: key);

  @override
  _MainscrState createState() => _MainscrState();
}

class _MainscrState extends State<Mainscr> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _drawerKey,
      drawer: DrawerScr(),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                width: 320.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#707070'), width: 2),
                    color: HexColor('#2B468B'),
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                  padding: EdgeInsets.only(right: 35.w, left: 0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'outMen'.tr,
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(() => OutMenha());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21.h, right: 20),
            child: Container(
              height: 120.h,
              child: FutureBuilder(
                future: rssToJson(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print(
                                  'hgghgh' +
                                      snapshot.data[index]['link'].toString(),
                                );
                                Get.to(() => OutMenhaDetails(
                                      snapshot.data[index]['description']
                                          .toString(),
                                      snapshot.data[index]['link'].toString(),
                                      snapshot.data[index]['title'].toString(),
                                    ));
                              },
                              child: MainCard(
                                snapshot.data[index]['title'].toString(),
                              ),
                            );
                          },
                        )
                      : Text('');
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                width: 320.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#707070'), width: 2),
                    color: HexColor('#2B468B'),
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                  padding: EdgeInsets.only(right: 35.w, left: 0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'inMen'.tr,
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(() => InsideMenha());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21.h, right: 20),
            child: Container(
              height: 120.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: InMenha('منحة النشاط الرياضي'),
                        onTap: () {
                          Get.to(() => InsideMenha());
                        },
                      ),
                      InkWell(
                        child: InMenha('منحة الجغرافيا'),
                        onTap: () {
                          Get.to(() => InsideMenha());
                        },
                      ),
                      InkWell(
                        child: InMenha('منحة اللغة العربية'),
                        onTap: () {
                          Get.to(() => InsideMenha());
                        },
                      ),
                      InkWell(
                        child: InMenha('منحة الكيمياء'),
                        onTap: () {
                          Get.to(() => InsideMenha());
                        },
                      ),
                      InkWell(
                        child: InMenha('منحة حفظة القران'),
                        onTap: () {
                          Get.to(() => InsideMenha());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                width: 320.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#707070'), width: 2),
                    color: HexColor('#2B468B'),
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                  padding: EdgeInsets.only(right: 35.w),
                  child: Text(
                    'kfalat'.tr,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.to(() => KfalaSign());
                },
                child: Container(
                  width: 212.w,
                  height: 73.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.grey[200],
                      border: Border.all(color: HexColor('#002481')),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      'mustafeed'.tr,
                      style: TextStyle(
                          fontSize: 18.sp, color: HexColor('#002481')),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
