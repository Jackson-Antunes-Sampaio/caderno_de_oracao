import 'package:cardeno_de_oracao/screens/base/base_screen.dart';
import 'package:cardeno_de_oracao/screens/home/home_screen.dart';
import 'package:cardeno_de_oracao/screens/login/login_screen.dart';
import 'package:cardeno_de_oracao/screens/new_post/new_post_screen.dart';
import 'package:cardeno_de_oracao/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPage {
  static const INITIAL = Routes.BASE;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      //binding: HomeBindings()
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      //binding: HomeBindings()
    ),
    GetPage(
      name: Routes.BASE,
      page: () => BaseScreen(),
      //binding: HomeBindings()
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpScreen(),
      //binding: HomeBindings()
    ),
    GetPage(
      name: Routes.NEWPOST,
      page: () => NewPostScreen(),
      //binding: HomeBindings()
    ),
  ];
}