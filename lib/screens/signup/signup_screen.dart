import 'package:cardeno_de_oracao/controller/user_controller.dart';
import 'package:cardeno_de_oracao/helpers/validators.dart';
import 'package:cardeno_de_oracao/models/user_model.dart';
import 'package:cardeno_de_oracao/routes/app_page.dart';
import 'package:cardeno_de_oracao/screens/login/componets/input_text_field.dart';
import 'package:cardeno_de_oracao/screens/login/componets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:cardeno_de_oracao/components/bottom_navigation_bar_custom.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  final User user = User();
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      bottomNavigationBar: BottomNavigationBarCustom(),
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: labelText('Nome:'),
                    ),
                    InputTextField(
                      hintText: "Jackson Antunes",
                      obscureText: false,
                      validator: (text) {
                        if (text == null) {
                          return "Campo inválido";
                        } else if (text.length <= 6) {
                          return "Campo inválido";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (text) => user.name = text,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: labelText('E-mail:'),
                    ),
                    InputTextField(
                      hintText: "exemplo@email.com",
                      obscureText: false,
                      validator: (text) {
                        if (!emailValid(text!)) {
                          return "Email inválido";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (text) => user.email = text,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: labelText('Nova Senha:'),
                    ),
                    InputTextField(
                      hintText: "*******",
                      obscureText: true,
                      validator: (text) {
                        if (text == null) {
                          return "Campo inválido";
                        } else if (text.length < 6) {
                          return "Campo inválido";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (text) => user.password = text,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: labelText('Confirmar Nova Senha:'),
                    ),
                    InputTextField(
                      hintText: "*******",
                      obscureText: true,
                      validator: (text) {
                        if (text == null) {
                          return "Campo inválido";
                        } else if (text.length < 6) {
                          return "Campo inválido";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (text) => user.confirmPassword = text,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 46,
                        width: 160,
                        child: RaisedButton(
                          onPressed: () async {
                            if (form.currentState!.validate()) {
                              form.currentState!.save();
                              if (user.password != user.confirmPassword) {
                                scaffold.currentState!.showSnackBar(SnackBar(
                                  content: const Text("Senhas não coincidem!"),
                                  backgroundColor: Colors.red,
                                ));
                                return;
                              }
                              userController.signUp(
                                  user: user,
                                  onSuccess: () {
                                    Get.back();
                                    Get.back();
                                  },
                                  onFail: (e) {
                                    scaffold.currentState!
                                        .showSnackBar(SnackBar(
                                      content: Text("Falha ao cadastrar: $e"),
                                      backgroundColor: Colors.red,
                                    ));
                                  });
                            }
                          },
                          child: Text(
                            "Criar Conta",
                            style: TextStyle(fontSize: 16),
                          ),
                          color: Color(0xff303f9f),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
