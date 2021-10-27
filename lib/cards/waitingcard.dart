import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaitingCard extends StatefulWidget {
  final String name;
  final String level;
  WaitingCard(this.name, this.level, {key}) : super(key: key);

  @override
  _WaitingCardState createState() => _WaitingCardState();
}

class _WaitingCardState extends State<WaitingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.only(right: 30.w, left: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#002481'),
              ),
            ),
            Text(
              // 'الاول',
              widget.level,
              style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#002481'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
