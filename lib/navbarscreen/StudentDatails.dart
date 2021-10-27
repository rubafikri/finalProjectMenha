import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:men7a/Backend/firebasebackend.dart';
import 'package:men7a/extraScreens/succ.dart';

class StudentDetails extends StatefulWidget {
  final String name;
  final String uniNum;
  final String specelize;
  final String hourPrice;
  final String hourNum;
  final String studentId;
  StudentDetails(this.name, this.uniNum, this.specelize, this.hourPrice,
      this.hourNum, this.studentId,
      {Key? key})
      : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  TextEditingController pricecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 27.h),
                child: Container(
                  width: 301.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: HexColor('#2B468B'),
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: Text(
                      'StuDetails'.tr,
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                width: 299.w,
                height: 359.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 203.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          color: HexColor('#2B468B'),
                          borderRadius: BorderRadius.circular(19)),
                      child: Center(
                        child: Text(
                          'name'.tr,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      widget.name,
                      // 'الاء مجدي حسن عايش',
                      style: TextStyle(
                          fontSize: 14.sp, color: HexColor('#2B468B')),
                    ),
                    Container(
                      width: 203.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          color: HexColor('#2B468B'),
                          borderRadius: BorderRadius.circular(19)),
                      child: Center(
                        child: Text(
                          'stuNum'.tr,
                          style:
                              TextStyle(fontSize: 13.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      widget.uniNum,
                      // '220172169',
                      style: TextStyle(
                          fontSize: 14.sp, color: HexColor('#2B468B')),
                    ),
                    Container(
                      width: 203.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          color: HexColor('#2B468B'),
                          borderRadius: BorderRadius.circular(19)),
                      child: Center(
                        child: Text(
                          'specialiest'.tr,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      widget.specelize,
                      // 'الحوسبة المتنقلة',
                      style: TextStyle(
                          fontSize: 14.sp, color: HexColor('#2B468B')),
                    ),
                    Container(
                      width: 203.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          color: HexColor('#2B468B'),
                          borderRadius: BorderRadius.circular(19)),
                      child: Center(
                        child: Text(
                          'hourPrice'.tr,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      widget.hourPrice,
                      // '25',
                      style: TextStyle(
                          fontSize: 14.sp, color: HexColor('#2B468B')),
                    ),
                    Container(
                      width: 203.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          color: HexColor('#2B468B'),
                          borderRadius: BorderRadius.circular(19)),
                      child: Center(
                        child: Text(
                          'hourNum'.tr,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      widget.hourNum,
                      // '14',
                      style: TextStyle(
                          fontSize: 14.sp, color: HexColor('#2B468B')),
                    ),
                  ],
                ),
              ),
            )),
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 37.h),
              child: Container(
                width: 168.w,
                height: 38.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor('#002481')),
                    borderRadius: BorderRadius.circular(19)),
                child: Center(
                  // child: Text(
                  //   'price'.tr,
                  //   style:
                  //       TextStyle(fontSize: 17.sp, color: HexColor('#707070')),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: TextField(
                      controller: pricecontroller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'price'.tr,
                          hintStyle: TextStyle(
                              fontSize: 17.sp, color: HexColor('#707070'))),
                    ),
                  ),
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (pricecontroller.text.toString() == '') {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: 'الرجاء ادخال المبلغ المراد دفعه',
                        );
                      } else {
                        updateAccept(
                                studentId: widget.studentId,
                                price: pricecontroller.text)
                            .then((value) {
                          Get.to(() => SuccScr());
                        });
                      }
                    },
                    child: Container(
                      width: 106.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.grey[300],
                          border:
                              Border.all(color: HexColor('#002481'), width: 2),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          'conPay'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#707070')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 106.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.grey[300],
                          border:
                              Border.all(color: HexColor('#FF0000'), width: 2),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          'back'.tr,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#707070')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
