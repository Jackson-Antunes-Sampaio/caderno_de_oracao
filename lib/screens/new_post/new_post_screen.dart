import 'package:cardeno_de_oracao/components/bottom_navigation_bar_custom.dart';
import 'package:cardeno_de_oracao/controller/new_post_controller.dart';
import 'package:cardeno_de_oracao/screens/new_post/components/choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostScreen extends StatelessWidget {

  final NewPostController newPostController = Get.put(NewPostController());
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarCustom(),
      appBar: AppBar(
        title: Text("Nova Publicação"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child:ListView(
          children: [
            Row(
              children: [
                ChoiceChipCustom(
                  name: "Oração",
                  selected: newPostController.prayer,

                ),
                ChoiceChipCustom(
                    name: "Testemunho",
                    selected: newPostController.testimony
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all()
              ),
              child: TextFormField(
                controller: description,
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: InputBorder.none
                ),
              ),
            ),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                    value: newPostController.checkBox.value,
                    onChanged: (newSelect) {
                      newPostController.checkBox.value = newSelect!;
                    },
                  );
                }),
                Expanded(
                  child: Text(
                    "Publicar anônimo.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              //width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
              ),
              alignment: Alignment.centerRight,
              child: RaisedButton(
                onPressed: (){},
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("Publicar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
