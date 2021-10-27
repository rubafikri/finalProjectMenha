import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:men7a/navbarscreen/kfalat.dart';

class SuccScr extends StatefulWidget {
  SuccScr({Key? key}) : super(key: key);

  @override
  _SuccScrState createState() => _SuccScrState();
}

class _SuccScrState extends State<SuccScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
                child: Text(
                  'تم تأكيد الدفع بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return KfalatScr();
                  }));
                },
                child: Text('Done')),
          )
        ],
      ),
    );
  }
}
