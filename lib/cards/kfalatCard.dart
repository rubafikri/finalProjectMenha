import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KfalatCard extends StatefulWidget {
  final String name;
  final String price;
  // final String specelize;
  // final String hourPrice;
  // final String hourNum;
  KfalatCard(this.name, this.price,
      //  this.specelize, this.hourPrice, this.hourNum,
      {Key? key})
      : super(key: key);

  @override
  _KfalatCardState createState() => _KfalatCardState();
}

class _KfalatCardState extends State<KfalatCard> {
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
              widget.price,
              // '25%',
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
