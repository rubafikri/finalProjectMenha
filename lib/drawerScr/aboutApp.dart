import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppScr extends StatefulWidget {
  AboutAppScr({Key? key}) : super(key: key);

  @override
  _AboutAppScrState createState() => _AboutAppScrState();
}

class _AboutAppScrState extends State<AboutAppScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 200.h),
            child: Center(
              child: Container(
                width: 283.w,
                height: 254.h,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: Text(
                      '''منحة: أول تطبيق يشمل جميع المنح الداخلية والخارجية لطلاب الجامعات، تطبيق يتيح لك التقديم لمنح، الحصول على فوائد مالية من متبرعين مختلفين. 
تطبيق منحة طريقك الأسهل للنجاح''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
