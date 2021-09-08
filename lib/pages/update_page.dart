import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/update_controller.dart';





class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _controller = Get.put(UpdateController());

  @override
  void initState() {
    super.initState();

    _controller.titleTextEditingController.text = widget.title;
    _controller.bodyTextEditingController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Obx(
          ()=>
         Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  // Title
                  Container(
                    height: 100,
                    padding: EdgeInsets.all(5),

                    child: Center(
                      child: TextField(maxLines: 2,
                        controller: _controller.titleTextEditingController,
                        style: TextStyle(fontWeight: FontWeight.bold,
                          ),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),




                  // Body
                  Container(
                    height: 500,
                    padding: EdgeInsets.all(5),

                    child: TextField(
                      controller: _controller.bodyTextEditingController,
                      style: TextStyle(fontSize: 20),
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Body',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _controller.isLoading != null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          _controller.apiPostUpdate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
