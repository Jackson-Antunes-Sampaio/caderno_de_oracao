import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';


class User {
  User(
      {this.email,
        this.password,
        this.name,
        this.id,
        this.image
      });

  User.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.data()!["name"] as String?;
    email = document.data()!["email"] as String?;
    image = document.data()!["image"] as String?;
  }

  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? image;


  bool admin = false;
  final FirebaseStorage storage = FirebaseStorage.instance;
  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc("users/$id");
  CollectionReference get tokenReference => firestoreRef.collection('tokens');
  Reference get storageRef => storage.ref().child('users/$id');

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "image": image,
    };
  }

  Future<void> saveData() async{
    await firestoreRef.set(toMap());
  }

  Future<void> saveToken()async{
    final token = await FirebaseMessaging.instance.getToken();

    await tokenReference.doc(token).set(
        {
          "token" : token,
          "updatedAt": FieldValue.serverTimestamp(),
          'platform' : Platform.operatingSystem,
        }
    );
  }

}