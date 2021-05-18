
import 'dart:async';

import 'package:cardeno_de_oracao/models/publication_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class PublicationController extends GetxController{

  List<Publication> publication = [];



  FirebaseFirestore firestore = FirebaseFirestore.instance;
  StreamSubscription? _subscription;

  Future<void> getPublication()async{

    _subscription = firestore
        .collection('publication')
        .where("public", isEqualTo: true)
        .snapshots()
        .listen((event) async{
      for(final doc in event.docs){
        publication.add(Publication.fromDocument(doc));
      }
    });

  }

}