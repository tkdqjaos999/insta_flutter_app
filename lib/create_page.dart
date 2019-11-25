import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File _image;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
          onPressed: _getImage,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Center(child: Text('새 게시물', style: TextStyle(fontSize: 16.0),)),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            onPressed: (){},
            ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0)),
          _image == null ? Text('No Image') : Image.file(_image,),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
          ),
        ],
      ),
    );
  }

  Future _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
