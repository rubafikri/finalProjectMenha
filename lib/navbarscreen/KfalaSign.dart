import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:men7a/Backend/firebasebackend.dart';
import '../extraScreens/successful.dart';

class KfalaSign extends StatefulWidget {
  KfalaSign({Key? key}) : super(key: key);

  @override
  _KfalaSignState createState() => _KfalaSignState();
}

class _KfalaSignState extends State<KfalaSign> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController specialistcontroller = TextEditingController();
  TextEditingController levelcontroller = TextEditingController();
  TextEditingController hourpricecontroller = TextEditingController();
  TextEditingController hourNumcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  // String userid = userCredential.user!.uid;
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
                    'kfalaReg'.tr,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: namecontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'name'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: numbercontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'stuNum'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: specialistcontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'specialiest'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: levelcontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'level'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: hourpricecontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'hourPrice'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: hourNumcontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'hourNum'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              width: 230.w,
              height: 25.h,
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: phonecontroller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'phoneNum'.tr),
              ),
            ),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 45.h),
            child: InkWell(
              onTap: () {
                if (namecontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال الاسم',
                  );
                } else if (numbercontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال الرقم الجامعي',
                  );
                } else if (specialistcontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال التخصص',
                  );
                } else if (levelcontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال المستوى الدراسي',
                  );
                } else if (hourpricecontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال سعر الساعة',
                  );
                } else if (hourNumcontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال عدد الساعات',
                  );
                } else if (phonecontroller.text == '') {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'يرجى ادخال رقم الهاتف',
                  );
                } else {
                  registerForMenha(
                    name: namecontroller.text,
                    uniNum: numbercontroller.text,
                    speclaize: specialistcontroller.text,
                    level: levelcontroller.text,
                    hourPrice: hourpricecontroller.text,
                    hourNum: hourNumcontroller.text,
                    phoneNum: phonecontroller.text,
                    accept: '0',
                    register: '1',
                  ).then((value) => {
                        if (value == true)
                          {Get.to(() => SuccessfullScr())}
                        else
                          {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: 'أنت مسجل بالفعل',
                            )
                          }
                      });
                }
              },
              child: Container(
                width: 161.w,
                height: 42.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: HexColor('#2B468B'), width: 2)),
                child: Center(
                    child: Text(
                  'log'.tr,
                  style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#002481')),
                )),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
