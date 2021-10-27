import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:men7a/navbar/navbar.dart';
import 'package:men7a/navbarscreen/kfalat.dart';
import 'package:men7a/services/services.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'appGet.dart';
import 'custom_dialoug.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
String usersCollectionName = 'Users';
final users = FirebaseDatabase.instance.reference().child("Users");
DatabaseReference dbRef =
    FirebaseDatabase.instance.reference().child("userNames");

String userId = '';
final AppGet appGet = Get.put(AppGet());

register(
    {String? name,
    String? email,
    String? password,
    BuildContext? context}) async {
  ProgressDialog pd = ProgressDialog(context: context);

  try {
    userId = (await registerUsingEmailAndPassword(
        email: email, password: password))!;
    print(userId.toString());
    // ignore: unnecessary_null_comparison
    if (userId == null) {
      throw ('register_failed');
    } else {
      bool isSuccess = await saveInFirestore(
          email: email,
          password: password,
          userId: userId,
          name: name,
          accept: '0');

      if (isSuccess == true) {
        getUserFromFirestore(userId: mytoken);
        appGet.tokenuser.value = userId;
        savetoken(userId, appGet.usertype.value);
        pd.close();

        Get.offAll(NavBar());
      }
      if (isSuccess == false) {
        pd.close();
        throw ('Failed Save user in firestore');
      }
    }
  } on Exception catch (e) {
    pd.close();
    CustomDialougs.utils
        .showDialoug(messageKey: e.toString(), titleKey: 'alert');
  }
}

Future<String?> registerUsingEmailAndPassword({
  String? email,
  String? password,
  String? name,
}) async {
  print(email.toString() + 'pass:=' + password.toString());
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
    print('hela' + userCredential.toString());
    if (userCredential != null) {
      userId = userCredential.user!.uid;
      appGet.tokenuser.value = userId;
      appGet.emails.value = email;
      saveInFirestore(
          email: email,
          password: password,
          userId: userId,
          name: name,
          accept: '0');
      savetoken(userId, appGet.usertype.value);

      return userId;
    } else {
      print('Errorss');
    }
  } on FirebaseAuthException catch (e) {
  } catch (e) {
    return null;
  }
}

Future<Map?> signInWithEmailAndPassword(
    {String? email,
    String? password,
    String? name,
    BuildContext? context}) async {
  ProgressDialog pd = ProgressDialog(context: context);
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
    // ignore: unnecessary_null_comparison
    if (userCredential != null) {
      String userId = userCredential.user!.uid;
      appGet.tokenuser.value = userId;
      Map? map = await getUserFromFirestore(userId: mytoken);
      savetoken(userId, appGet.usertype.value);
      pd.close();
      Get.to(() => NavBar());
    } else {
      pd.close();
      return null;
    }
  } on FirebaseAuthException catch (e) {
    pd.close();
    if (e.code == 'user-not-found') {
    } else if (e.code == 'wrong-password') {}
    return null;
  } catch (e) {
    return null;
  }
}

Future<bool> saveInFirestore(
    {String? email,
    String? password,
    String? name,
    String? uniNum,
    String? speclaize,
    String? level,
    String? hourPrice,
    String? hourNum,
    String? phoneNum,
    String? userId,
    String? accept,
    String? register,
    String? price}) async {
  try {
    await firestore.collection(usersCollectionName).doc(userId).set({
      'email': email,
      'password': password,
      'name': name,
      'uniNum': uniNum,
      'speclaize': speclaize,
      'level': level,
      'hourPrice': hourPrice,
      'hourNum': hourNum,
      'phoneNum': phoneNum,
      'userId': userId,
      'accept': accept,
      'register': register,
      'minPrice': price,
    });
    // saveUserNameInRealtimeDb(userName: userName);
    // appGet.pr.hide();
    return true;
  } on Exception catch (e) {
    print(e);

    return false;
  }
}

Future<Map<String, dynamic>?> getUserFromFirestore({String? userId}) async {
  print(userId);
  var documentSnapshot =
      await firestore.collection(usersCollectionName).doc(userId).get();

  Map<String, dynamic>? responce = documentSnapshot.data();
  print(responce);
  appGet.data.value = responce!;

  return responce;
}

Stream<QuerySnapshot>? getAllnames() {
  Stream<QuerySnapshot> stream = firestore
      .collection('Users')
      .where('accept', isEqualTo: '0')
      .where('register', isEqualTo: '1')
      .snapshots();
  // print(stream.toString());
  return stream;
}

Stream<QuerySnapshot>? getAllAcceptnames() {
  Stream<QuerySnapshot> stream = firestore
      .collection('Users')
      .where('accept', isEqualTo: '1')
      .where('register', isEqualTo: '1')
      .snapshots();
  return stream;
}

Future<bool> registerForMenha(
    {String? email,
    String? password,
    String? name,
    String? uniNum,
    String? speclaize,
    String? level,
    String? hourPrice,
    String? hourNum,
    String? phoneNum,
    String? accept,
    String? register,
    String? price}) async {
  print(userId);
  try {
    await firestore
        .collection(usersCollectionName)
        .doc(
          appGet.data['userId'].toString(),
        )
        .update({
      'name': name,
      'uniNum': uniNum,
      'speclaize': speclaize,
      'level': level,
      'hourPrice': hourPrice,
      'hourNum': hourNum,
      'phoneNum': phoneNum,
      'accept': accept,
      'register': register,
      'minPrice': price,
    });
    // saveUserNameInRealtimeDb(userName: userName);
    // appGet.pr.hide();
    return true;
  } on Exception catch (e) {
    print(e);

    return false;
  }
}

Future<bool> updateAccept({String? studentId, String? price}) async {
  print(studentId);
  try {
    firestore.collection(usersCollectionName).doc(studentId).update({
      'accept': '1',
      'minPrice': price,
    });
    return true;
  } on Exception catch (e) {
    print(e);
    return false;
  }
}

fireSearch(String queryText) {
  firestore
      .collection('maneh')
      .where('email', isEqualTo: (queryText))
      .get()
      .then((value) {
    if (value.docs.length > 0) {
      print('1');
      Get.offAll(() => KfalatScr());
    } else {
      Get.offAll(() => NavBar());
      print('2');
    }
  });
}
