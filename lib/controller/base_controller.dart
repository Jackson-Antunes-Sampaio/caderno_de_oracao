

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController{

  final PageController pageController = PageController();
  RxInt index = 0.obs;
}