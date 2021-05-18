import 'package:cardeno_de_oracao/controller/base_controller.dart';
import 'package:cardeno_de_oracao/controller/user_controller.dart';
import 'package:cardeno_de_oracao/helpers/validators.dart';
import 'package:cardeno_de_oracao/models/user_model.dart';
import 'package:cardeno_de_oracao/routes/app_page.dart';
import 'package:cardeno_de_oracao/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'componets/input_text_field.dart';
import 'componets/label_text.dart';
import 'componets/login_social_media.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final UserController userController = Get.find();
  final BaseController baseController = Get.find();
  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              // Header(),
              // SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
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
                      child: labelText('Senha:'),
                    ),
                    InputTextField(
                      hintText: "*******",
                      obscureText: true,
                      validator: (text) {
                        if (text!.isEmpty || text.length < 6) {
                          return 'Senha Inválida';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (text) => user.password = text,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Esqueceu sua Senha?',
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                      ),
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
                              userController.signIn(
                                  user: user,
                                  onFail: (e) {
                                    scaffold.currentState!
                                        .showSnackBar(SnackBar(
                                      content: Text("Falha ao entrar: $e"),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  onSuccess: () {
                                    baseController.index.value = 0;
                                   baseController.pageController.jumpToPage(baseController.index.value);
                                  });
                            }
                          },
                          child: Text(
                            "ENTRAR",
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
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Ou",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LoginSocialMediaBtn(
                          icon: FontAwesomeIcons.facebookF,
                          color: facebookColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        LoginSocialMediaBtn(
                          icon: FontAwesomeIcons.google,
                          color: googleColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        LoginSocialMediaBtn(
                          icon: FontAwesomeIcons.twitter,
                          color: twitterColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Container(
                        color: Colors.grey[50],
                        padding: EdgeInsets.only(bottom: 16),
                        height: 60,
                        child: Center(
                          child: Text(
                            'Não tem conta? Cadastre-se agora',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: facebookColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
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
