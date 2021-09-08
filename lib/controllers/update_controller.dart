import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/model/post_model.dart';
import 'package:pattern_getx/pages/home_page.dart';
import 'package:pattern_getx/services/http_service.dart';

import 'home_controller.dart';

class UpdateController{
  var  isLoading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();
  final _homeController = Get.put(HomeController());
  apiPostUpdate(BuildContext context) async {
    isLoading(true);
    Post post = Post(
        id: Random().nextInt(999),
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(999));
    var response =
    await Network.PUT(Network.API_UPDATE , Network.paramsUpdate(post));
    if (response != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }
    isLoading (false);

  }
}