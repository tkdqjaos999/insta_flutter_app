import 'package:flutter/material.dart';

import 'create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blueAccent,
      ),
      appBar: AppBar(

      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
        ),
        itemBuilder: (context, index){
          return _buildListItem(context, index);
        },
        itemCount: 5,
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('http://scienceon.hani.co.kr/files/attach/images/73/683/496/001.jpg',
    fit: BoxFit.cover,
    );
  }
}
