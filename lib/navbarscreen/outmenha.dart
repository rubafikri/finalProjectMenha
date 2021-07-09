import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men7a/cards/outmenhaCard.dart';
import 'package:men7a/extraScreens/outmenhaDetails.dart';
import 'package:men7a/drawerScr/drawerScr.dart';
import 'package:men7a/services/services.dart';

class OutMenha extends StatefulWidget {
  OutMenha({Key? key}) : super(key: key);

  @override
  _OutMenhaState createState() => _OutMenhaState();
}

class _OutMenhaState extends State<OutMenha> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: DrawerScr(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 45.h),
              child: FutureBuilder(
                  future: rssToJson(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? Container(
                            width: 360.w,
                            // height: 203.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return GridView.builder(
                                  physics: ScrollPhysics(),
                                  itemCount: 8,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          print(
                                            'hgghgh' +
                                                snapshot.data[index]['link']
                                                    .toString(),
                                          );
                                          Get.to(() => OutMenhaDetails(
                                                snapshot.data[index]
                                                        ['description']
                                                    .toString(),
                                                snapshot.data[index]['link']
                                                    .toString(),
                                                snapshot.data[index]['title']
                                                    .toString(),
                                              ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.w, right: 20.w),
                                          child: OutMenhaCard(
                                              snapshot.data[index]['title']
                                                  .toString(),
                                              snapshot.data[index]
                                                      ['description']
                                                  .toString(),
                                              snapshot.data[index]['link']
                                                  .toString()),
                                        ));
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 5,
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 2,
                                          childAspectRatio: 0.6 / .5),
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 250.h),
                            child: Center(child: CircularProgressIndicator()),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
