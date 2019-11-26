import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _bulidBody(),
    );
  }

  Widget _bulidBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 8.0)),
                CircleAvatar(
                  backgroundImage: NetworkImage(document['userPhotoUrl']),
                ),
                Padding(padding: EdgeInsets.only(left: 8.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 4.0)),
                    Text(document['email'], style: TextStyle(fontWeight: FontWeight.bold),),
                    Padding(padding: EdgeInsets.only(top: 4.0)),
                    Text(document['displayName'])
                  ],
                )
              ],
            ),),
            Hero(
              tag: document['photoUrl'],
                child: Image.network(document['photoUrl'])
            ),
            Padding(padding: EdgeInsets.all(8.0) ,child: Text(document['contents'], style: TextStyle(fontSize: 16),)),
          ],
        ),
      ),
    );
  }
}
