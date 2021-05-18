
import 'package:cardeno_de_oracao/controller/new_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ChoiceChipCustom extends StatelessWidget {

  ChoiceChipCustom({required this.selected, required this.name});

  final NewPostController newPostController = Get.find();

  RxBool selected;
  final String name;


  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ChoiceChip(
          elevation: 2,
          onSelected: (value){
            selected.value = value;
            if(name != "Oração") {
              newPostController.prayer.value = false;
              newPostController.testimony.value = true;
            } else{
            newPostController.prayer.value = true;
            newPostController.testimony.value = false;
            }

          },
          label: Row(
            children: [
              if(selected.value)
                Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              Text(
                "$name",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          selected: selected.value,
        ),
      );
    });
  }
}
