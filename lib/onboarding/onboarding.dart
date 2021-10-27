import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:men7a/navbar/navbar.dart';
import 'package:men7a/navbarscreen/kfalat.dart';
import 'package:men7a/services/services.dart';
import 'package:men7a/signin/signin.dart';
import 'package:men7a/utilities/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0.h,
      width: isActive ? 24.0.w : 16.0.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  gettoken() async {
    preferences = await SharedPreferences.getInstance();
    mytoken = preferences?.getString('token');
    type = preferences?.getString('userType');
    if (mytoken == null) {
    } else {
      if (type == '1') {
        Get.offAll(() => KfalatScr());
      } else {
        Get.offAll(() => NavBar());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    gettoken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/main.png'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        Get.to(() => Signin());
                      },
                      child: Text(
                        'ابدأ',
                        style: TextStyle(
                          color: HexColor("#2B468B"),
                          fontSize: 20.0.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 600.0.h,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboard2.png',
                                  ),
                                  height: 300.h,
                                  width: 300.w,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 160.h),
                                  child: Text(
                                    'نساعدك لإيجاد المنحة',
                                    style: kTitleStyle,
                                  ),
                                ),
                              ),
                              // SizedBox(height: 0),
                              Center(
                                child: Text(
                                  ' الافضل',
                                  style: kTitleStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboard1.png',
                                  ),
                                  height: 300.0.h,
                                  width: 300.0.w,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 120.h),
                                  child: Container(
                                    width: 200.w,
                                    child: Text(
                                        'يتضمن منح داخلية وخارجية ويمنحك معلومات التسجيل',
                                        textAlign: TextAlign.center,
                                        style: kTitleStyle),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/4.png',
                                  ),
                                  height: 300.0.h,
                                  width: 300.0.w,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 120.h),
                                  child: Text(
                                    'إذا كنت مانحاً أو مستفيد ',
                                    style: kTitleStyle,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0.h),
                              Center(
                                child: Text(
                                  ' فتطبيقنا سيساعدك',
                                  style: kTitleStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Text(''),
      ),
    );
  }
}
