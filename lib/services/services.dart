import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

String username = '';
String menhaname = '';
String uninum = '';
String? mytoken = '';
String? type = '';

savetoken(String token, String type) async {
  preferences = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  final key2 = 'userType';
  final value2 = type;
  mytoken = token;
  print('new my token ' + mytoken!);
  await preferences?.setString(key, value);
  await preferences?.setString(key2, value2);
}

kiltoken() async {
  preferences = await SharedPreferences.getInstance();
  final key = 'token';
  final key2 = 'userType';
  await preferences?.remove(key);
  await preferences?.remove(key2);
}

Future<List> rssToJson() async {
  var url = Uri.parse('https://cuisine-kouzina.blogspot.com/rss.xml');
  var client = http.Client();
  final myTranformer = Xml2Json();
  return await client.get(url).then((response) {
    return response.body;
  }).then((bodyString) {
    myTranformer.parse(bodyString);
    var json = myTranformer.toParker();
    return jsonDecode(json)['rss']['channel']['item'];
  });
}
