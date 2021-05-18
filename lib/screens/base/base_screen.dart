import 'package:cardeno_de_oracao/controller/user_controller.dart';
import 'package:cardeno_de_oracao/routes/app_page.dart';
import 'package:cardeno_de_oracao/screens/home/home_screen.dart';
import 'package:cardeno_de_oracao/screens/login/login_screen.dart';
import 'package:cardeno_de_oracao/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:cardeno_de_oracao/controller/base_controller.dart';
import 'package:cardeno_de_oracao/components/bottom_navigation_bar_custom.dart';

class BaseScreen extends StatelessWidget {

  final BaseController baseController = Get.put(BaseController());
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: baseController.pageController,
        children: [
          HomeScreen(),
          Scaffold(
            body: Center(
              child: Text("Em Desenvolvimento"),
            ),
          ),
          if(userController.user == null)
          LoginScreen(),
          if(userController.user != null)
          ProfileScreen(),
          Scaffold(
            body: Center(
              child: Text("Em Desenvolvimento"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(Routes.NEWPOST);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}
