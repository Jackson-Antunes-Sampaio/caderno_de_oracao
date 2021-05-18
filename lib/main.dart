import 'package:cardeno_de_oracao/routes/app_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  //
  // await users
  //     .add({
  //       'full_name': "John Doe", // John Doe
  //       'company': "Stokes and Sons", // Stokes and Sons
  //       'age': "41" // 42
  //     })
  //     .then((value) => print("User Added"))
  //     .catchError((error) => print("Failed to add user: $error"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff800b8d),
      ),
      initialRoute: AppPage.INITIAL,
      getPages: AppPage.routes,
    );
  }
}
