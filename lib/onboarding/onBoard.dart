import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:men7a/services/services.dart';
import 'package:men7a/signin/signin.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<OnBoardModel> onBoardData = [
    OnBoardModel(
      title: "",
      description: 'perfect'.tr,
      imgUrl: "assets/images/onboard1.png",
    ),
    OnBoardModel(
      title: "",
      description: 'inoutmen'.tr,
      imgUrl: 'assets/images/onboard2.png',
    ),
    OnBoardModel(
      title: "",
      description: 'help'.tr,
      imgUrl: 'assets/images/4.png',
    ),
  ];
  final PageController _pageController = PageController();

  @override
  void initState() {
    rssToJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/main.png'), fit: BoxFit.fill)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: OnBoard(
        pageController: _pageController,
        onBoardData: onBoardData,
        onSkip: () {
          print('skipped');
        },
        onDone: () {
          print('done tapped');
        },
        descriptionStyles: TextStyle(
            fontSize: 18, color: Colors.white, fontFamily: 'Cairo-Regular'),
        pageIndicatorStyle: PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.grey[900],
          activeColor: Colors.white,
          inactiveSize: Size(8, 8),
          activeSize: Size(8, 8),
        ),
        skipButton: FlatButton(
          onPressed: () {
            Get.offAll(() => Signin());

            print('skipped');
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'start'.tr,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.bold,
                      color: HexColor('#2B468B')),
                ),
              ),
            ),
          ),
        ),
        nextButton: Container(),
      ),
    ));
  }
}
