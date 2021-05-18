
import 'dart:io';

import 'package:cardeno_de_oracao/helpers/firebase_errors.dart';
import 'package:cardeno_de_oracao/models/user_model.dart' as userModel;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';


class UserController extends GetxController{

  UserController() {
    _loadCurrentUser();
  }

  RxBool loading = false.obs;


  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  userModel.User? user;


  Future<void> signIn({required userModel.User user, Function? onFail, required Function onSuccess}) async {
    loading.value = true;

    try {
      final result = await auth.signInWithEmailAndPassword( //AuthResult
          email: user.email!, password: user.password!);

      await _loadCurrentUser(firebaseUser: result.user);
      onSuccess();

    }catch(e){
      onFail!(getErrorString(e.toString()));
    }
    loading.value = false;
  }

  Future<void> signUp ({required userModel.User user, Function? onFail, required Function onSuccess}) async{

    loading.value = true;

    try {
      final result = await auth.createUserWithEmailAndPassword( //AuthResult
          email: user.email!, password: user.password!);

      user.id = result.user!.uid;

      this.user = user;

      await user.saveData();

      user.saveToken();

      onSuccess();
    } on PlatformException catch (e) {
      onFail!(getErrorString(e.code));
    }
    loading.value = false;

  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    final User? currentUser = firebaseUser?? await auth.currentUser;

    if (currentUser != null) {
      final DocumentSnapshot docUser = await firestore.collection("users").doc(currentUser.uid).get();
      user = userModel.User.fromDocument(docUser);

      user!.saveToken();

      final docAdmin = await firestore.collection("admins").doc(user!.id).get();

      if(docAdmin.exists){
        user!.admin = true;
      }

    }
  }

  void signOut(){
    auth.signOut();
    user = null;
  }


  final FirebaseStorage storage = FirebaseStorage.instance;
  Reference get storageRef => storage.ref().child('users/${user?.id}');


  Future<void> uploadImage(File imagePath)async{
    try {
      TaskSnapshot taskSnapshot = await storageRef.child(Uuid().v1()).putFile(imagePath);
      print("${taskSnapshot.state}");
      final String url = await taskSnapshot.ref.getDownloadURL();
      user?.image = url;
      user!.saveData();
    } on FirebaseException catch (e) {
      print(e);
    }
  }


}