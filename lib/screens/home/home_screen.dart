import 'package:cardeno_de_oracao/components/bottom_navigation_bar_custom.dart';
import 'package:cardeno_de_oracao/controller/publication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/post_widget.dart';

class HomeScreen extends StatelessWidget {

  final PublicationController publicationController = Get.put(PublicationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos | Orações | Testemunhos"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: ()async{
                await publicationController.getPublication();
              })
        ],
      ),
      body: ListView.builder(
        itemCount: publicationController.publication.length,
        itemBuilder: (context, index){
          return PostWidget(
            image: publicationController.publication[index].imageuid,
            text: publicationController.publication[index].text,
            name: publicationController.publication[index].name,
            date: publicationController.publication[index].date,
          );
        },
      ),
    );
  }
}
