import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MainCard extends StatefulWidget {
  final String ouname;
  MainCard(this.ouname, {Key? key}) : super(key: key);

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 142.w,
          height: 149.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: HexColor('#002481')),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),

                spreadRadius: 5,

                blurRadius: 5,

                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage('assets/images/4.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: 142.w,
          height: 149.h,
          decoration: BoxDecoration(color: Colors.black.withOpacity(.5)),
        ),
        Container(
          width: 150.w,
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
          child: Text(
            widget.ouname,
            textAlign: TextAlign.center,
            // 'menhaName'.tr,

            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
