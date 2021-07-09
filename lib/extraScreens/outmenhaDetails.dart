import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class OutMenhaDetails extends StatefulWidget {
  final String desc;
  final String link;
  final String title;
  OutMenhaDetails(this.desc, this.link, this.title, {Key? key})
      : super(key: key);

  @override
  _OutMenhaDetailsState createState() => _OutMenhaDetailsState();
}

class _OutMenhaDetailsState extends State<OutMenhaDetails> {
  _launchURL() async {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${widget.link}',
      queryParameters: {'name': 'menha', 'about': 'Flutter Dart'},
    );

    if (await canLaunch(widget.link)) {
      await launch(uri.toString());
    } else {
      print('Could not launch ${widget.link}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#2B468B'),
        automaticallyImplyLeading: false,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15,
                ),
                onPressed: () {
                  Get.back();
                }),
            Container(
              width: 300.w,
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Center(
              child: Container(
                width: 283.w,
                height: 159.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4), color: Colors.grey),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image(
                      image: AssetImage('assets/images/out.png'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 65.h, bottom: 40.h),
            child: Center(
              child: Container(
                width: 283.w,
                // height: 254.h,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'menhaInfo'.tr,
                        style: TextStyle(
                            fontSize: 23.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Html(
                        data: widget.desc,
                        onLinkTap: (url, context, attributes, element) async {
                          if (await canLaunch(url!)) {
                            await launch(
                              url,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        // textAlign: TextAlign.start,
                        // style: TextStyle(
                        //   fontSize: 15.sp,
                        //   color: HexColor('#707070'),
                        // ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       _launchURL();
          //     });
          //     print(widget.link.toString());
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 76.h),
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Container(
          //         width: 360.w,
          //         height: 66.h,
          //         decoration: BoxDecoration(
          //             color: HexColor('#2B468B'),
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(53),
          //                 topRight: Radius.circular(53))),
          //         child: Center(
          //             child: Text(
          //           'registerLink'.tr,
          //           style: TextStyle(
          //               fontSize: 20.sp,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //         )),
          //       ),
          //     ),
          //   ),
          // ),
          // Link(
          //   uri: Uri.parse(widget.link),
          //   target: LinkTarget.blank,
          //   builder: (ctx, openLink) {
          //     return TextButton.icon(
          //       onPressed: openLink,
          //       label: Text('Link Widget documentation'),
          //       icon: Icon(Icons.read_more),
          //     );
          //   },
          // ),
        ],
      ),
    ));
  }
}
