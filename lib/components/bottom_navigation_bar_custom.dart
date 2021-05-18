import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:cardeno_de_oracao/controller/base_controller.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  final BaseController baseController = Get.find();
  final SnakeBarBehaviour behaviour = SnakeBarBehaviour.pinned;
  final SnakeShape snakeShape = SnakeShape.indicator;

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return SnakeNavigationBar.color(
        behaviour: behaviour,
        currentIndex: baseController.index.value,
        snakeShape: snakeShape,
        snakeViewColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[800],
        //showSelectedLabels: true,
        //showUnselectedLabels
        onTap: (index){
          baseController.index.value = index;
          baseController.pageController.jumpToPage(index);
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'menu',
          ),
        ],
      );
    });
  }
}
