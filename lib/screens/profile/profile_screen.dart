import 'dart:io';
import 'package:cardeno_de_oracao/controller/base_controller.dart';
import 'package:cardeno_de_oracao/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {

  final UserController userController = Get.find();
  final BaseController baseController = Get.find();



  void _bottomSheet(BuildContext context){
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight:
              Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: ()async{
                  File _image ;
                  final picker = ImagePicker();

                    final pickedFile = await picker.getImage(source: ImageSource.camera);

                      if (pickedFile != null) {
                        _image = File(pickedFile.path);
                        await userController.uploadImage(_image);
                      } else {
                        print('No image selected.');
                      }
                },
                title: Text("Câmera"),
                leading: Icon(Icons.camera_alt_rounded),
              ),
              ListTile(
                onTap: ()async{
                  File _image ;
                  final picker = ImagePicker();

                  final pickedFile = await picker.getImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    _image = File(pickedFile.path);
                    await userController.uploadImage(_image);
                  } else {
                    print('No image selected.');
                  }
                },
                title: Text("Galeria"),
                leading: Icon(Icons.image),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          userController.user?.image
                              ??
                              "https://www.promoview.com.br/uploads/images/unnamed%2819%29.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: (){
                              _bottomSheet(context);
                            },
                            icon: Icon(Icons.camera_alt_rounded, size: 30,)
                        ),
                      )
                    ],
                  ),
                  Text(
                    "${userController.user?.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  Text("${userController.user?.email}"),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        userController.signOut();
                        baseController.index.value = 0;
                        baseController.pageController.jumpToPage(baseController.index.value);
                      },
                      child: Text(
                        "Sair",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
