import 'package:cardeno_de_oracao/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'icon_description.dart';

class PostWidget extends StatelessWidget {

  PostWidget({required this.text, required this.name, required this.image, required this.date});

  String? text;
  String? name;
  String? image;
  Timestamp? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      image ?? noImage,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name!,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${date!.toDate()}",
                          style: TextStyle(),
                        )
                      ],
                    )
                  ),
                ),
                IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  text!,
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: IconDescription(
                      title: "Feito",
                      iconData: Icons.thumb_up,
                      callback: () {},
                    ),
                  ),
                  Expanded(
                    child: IconDescription(
                      title: "Comentar",
                      iconData: Icons.messenger_outline,
                      callback: () {},
                    ),
                  ),
                  Expanded(
                    child: IconDescription(
                      title: "Favoritar",
                      iconData: Icons.favorite,
                      callback: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
