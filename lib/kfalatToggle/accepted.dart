import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:men7a/cards/kfalatCard.dart';
import '../Backend/firebasebackend.dart';

class AcceptedScr extends StatefulWidget {
  AcceptedScr({Key? key}) : super(key: key);

  @override
  _AcceptedScrState createState() => _AcceptedScrState();
}

class _AcceptedScrState extends State<AcceptedScr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: 360.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: EdgeInsets.only(right: 17.w, left: 17.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'stuName'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: HexColor('#002481'),
                    ),
                  ),
                  Text(
                    'kfalamount'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: HexColor('#002481'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 19.h),
            child: Container(
              // height: double.infinity,
              child: StreamBuilder(
                stream: getAllAcceptnames(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  QuerySnapshot? querySnapshot = snapshot.data;
                  return snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: querySnapshot!.size,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                // onTap: () {
                                //   Get.to(() => StudentDetails(
                                //         querySnapshot.docs[index]['name']
                                //             .toString(),
                                //         querySnapshot.docs[index]['uniNum']
                                //             .toString(),
                                //         querySnapshot.docs[index]['speclaize']
                                //             .toString(),
                                //         querySnapshot.docs[index]['hourPrice']
                                //             .toString(),
                                //         querySnapshot.docs[index]['hourNum']
                                //             .toString(),
                                //         querySnapshot.docs[index]['userId']
                                //             .toString(),
                                //       ));
                                // },
                                child: KfalatCard(
                              // menhaname.toString()
                              querySnapshot.docs[index]['name'].toString(),
                              querySnapshot.docs[index]['minPrice'].toString(),
                            ));
                          })
                      : Center(child: CircularProgressIndicator());
                },
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 20,
              //   itemBuilder: (context, index) {
              //     return InkWell(
              //         onTap: () {
              //           Get.to(() => StudentDetails());
              //         },
              //         child: KfalatCard(

              //         ));
              //   },
              // ),
            ),
          )
        ],
      ),
    );
  }
}
