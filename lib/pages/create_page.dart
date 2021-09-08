

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/create_controller.dart';


class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Obx(
          ()=> Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Title
                  Container(
                    height: 50,

                    child: Center(
                      child: TextField(
                        controller: _controller.titleTextEditingController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // Body
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: _controller.bodyTextEditingController,
                      style: TextStyle(fontSize: 18),
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
          _controller.apiPostCreate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
