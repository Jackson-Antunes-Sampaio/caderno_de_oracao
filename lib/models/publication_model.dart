
import 'package:cloud_firestore/cloud_firestore.dart';

class Publication {

  Publication({
    this.text,
    this.date,
    this.uid
});

  Publication.fromDocument(DocumentSnapshot doc){
    uid = doc.data()!["uid"] as String?;
    text = doc.data()!["text"] as String?;
    date = doc.data()!["date"] as Timestamp?;
    imageuid = doc.data()!["imageuid"] as String?;
    name = doc.data()!["name"] as String?;
    public = doc.data()!["public"] as bool?;
    type = doc.data()!["type"] as String;
  }

  String? uid;
  String? name;
  String? imageuid;
  String? text;
  Timestamp? date;
  bool? public;
  String? type;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference get firestoreRef => firestore.collection('orders').doc("KBKJ0ZutVnunDAeBOIGO");

  @override
  String toString() {
    return 'Publication{uid: $uid, name: $name, image: $imageuid, text: $text, date: $date, firestore: $firestore}';
  }
}