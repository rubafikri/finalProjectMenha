// import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:men7a/Backend/firebasebackend.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // static final FacebookLogin facebookSignIn = new FacebookLogin();
  // String _message = 'Log in/out by pressing the buttons below.';

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confpasswordcontroller = TextEditingController();

  bool visiblbool = true;
  bool visiblbool2 = true;

  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: 50.h),
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 40.h),
          //   child: Center(
          //     child: Container(
          //       width: 132.w,
          //       height: 132.h,
          //       decoration: BoxDecoration(shape: BoxShape.circle),
          //       child:
          //           Image(image: AssetImage('assets/images/selectphoto.png')),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Image.asset(
              'assets/images/logo.png',
              width: 140.w,
              height: 140.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Text(
              'newAcc'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27.sp,
                  color: HexColor('#2B468B'),
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
              controller: namecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'الاسم'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              obscureText: visiblbool,
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
                          visiblbool = !visiblbool;
                        });
                      },
                    ),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              obscureText: visiblbool,
              controller: confpasswordcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'تأكيد كلمة المرور',
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
            padding: EdgeInsets.only(top: 20.h),
            child: Center(
              child: InkWell(
                onTap: () {
                  if (emailcontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'يرجى ادخال البريد',
                    );
                  } else if (confpasswordcontroller.text !=
                      passwordcontroller.text) {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'يرجى ادخال كلمة المرور بطريقة صحيحة',
                    );
                  } else if (passwordcontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'يرجى ادخال كلمة المرور',
                    );
                  } else if (namecontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'يرجى ادخال الاسم',
                    );
                  }
                  //  else if(){}
                  else {
                    pd.show(max: 100, msg: '  جاري التحميل  ');
                    register(
                        email: emailcontroller.text.toString(),
                        password: passwordcontroller.text.toString(),
                        name: namecontroller.text.toString(),
                        context: context);
                    // .then((value) {
                    //   print('hhrehtrhgtehtgerhtrh,,,,,,' + userId);
                    //   if (userId == '') {
                    //     CoolAlert.show(
                    //       context: context,
                    //       type: CoolAlertType.error,
                    //       text: 'Invalid Data',
                    //     );
                    //   } else {
                    //     Get.offAll(() => NavBar());
                    //   }
                    // });
                  }
                },
                child: Container(
                  width: 161.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#2B468B'), width: 2),
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
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                width: 231.w,
                height: 34.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('#2B468B')),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/facebook.png'),
                    ),
                    Text(
                      'facebook'.tr,
                      style: TextStyle(
                        fontSize: 21.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
