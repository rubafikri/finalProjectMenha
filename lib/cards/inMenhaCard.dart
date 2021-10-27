import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class InMenha extends StatefulWidget {
  String name;
  InMenha(this.name, {Key? key}) : super(key: key);

  @override
  _InMenhaState createState() => _InMenhaState();
}

class _InMenhaState extends State<InMenha> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 140.w,
            height: 180.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(color: HexColor('#002481'), width: 2),
                borderRadius: BorderRadius.circular(4)),
            child: Image(
              image: AssetImage(
                'assets/images/4.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 140.w,
            height: 180.h,
            color: Colors.black.withOpacity(0.6),
          ),
          Container(
            width: 140.w,
            height: 180.h,
            child: Padding(
              padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 10.h),
              child: Text(
                widget.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
