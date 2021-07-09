import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men7a/navbar/navbar.dart';
import 'package:men7a/signup/signUp.dart';
import 'package:men7a/Backend/firebasebackend.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool visiblbool2 = true;
  bool checkvalue = false;

  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 62.h),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 140.w,
                  height: 140.h,
                )),
            Padding(
              padding: EdgeInsets.only(top: 39.h),
              child: Text(
                'login'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 27.sp,
                    color: HexColor('#002481'),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'البريد الالكتروني',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                obscureText: visiblbool2,
                controller: passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'كلمة المرور',
                    suffixIcon: Visibility(
                      visible: true,
                      child: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            visiblbool2 = !visiblbool2;
                          });
                        },
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, right: 55.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: HexColor('#2B468B'),
                      value: checkvalue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          checkvalue = newValue!;
                          appGet.usertype.value = '1';
                        });
                      }),
                  Text(
                    'maneh'.tr,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: HexColor('#2B468B'),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 51.h),
              child: Center(
                child: InkWell(
                  onTap: () {
                    if (emailcontroller.text == '') {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: 'يرجى ادخال البريد',
                      );
                    } else if (passwordcontroller.text == '') {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: 'يرجى ادخال كلمة المرور',
                      );
                    } else {
                      if (checkvalue == false) {
                        pd.show(max: 100, msg: '  جاري التحميل  ');
                        signInWithEmailAndPassword(
                                email: emailcontroller.text.toString(),
                                password: passwordcontroller.text.toString(),
                                context: context)
                            .then((value) {
                          print('hhrehtrhgtehtgerhtrh,,,,,,' + userId);
                        });
                      } else {
                        fireSearch(emailcontroller.text.toString());
                      }
                    }
                  },
                  child: Container(
                    width: 161.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#2B468B'), width: 2.w),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'log'.tr,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#2B468B')),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(() => SignUp());
                },
                child: Text(
                  'newAcc'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#2B468B')),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     width: 395.w,
            //     height: 108.h,
            //     decoration: BoxDecoration(
            //         color: HexColor('#2B468B'),
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(53),
            //             topRight: Radius.circular(53))),
            //     child: Center(
            //       child: InkWell(
            //         onTap: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => SignUp()));
            //         },
            //         child: Text(
            //           'إنشاء حساب جديد',
            //           style: TextStyle(
            //               fontSize: 20.sp,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
