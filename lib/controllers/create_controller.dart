import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/model/post_model.dart';
import 'package:pattern_getx/pages/home_page.dart';
import 'package:pattern_getx/services/http_service.dart';

class CreateController extends GetxController{
  var  isLoading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();
  final _createController = Get.put(CreateController());

  apiPostCreate(BuildContext context) async {
    isLoading (true);
    Post post = Post(
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(99999));

    var response =
    await Network.GET(Network.API_CREATE, Network.paramsCreate(post));


      if (response != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }
      isLoading(false);

  }
}