import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Instagram Clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
        ),
      ),),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Instagram에 오신 것을 환영합니다',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text('사진과 동영상을 보려면 팔로우하세요'),
                  Padding(padding: EdgeInsets.all(16.0)),
                  SizedBox(
                    width: 260.0,
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(8.0)),
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoUrl),
                            ),
                      ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(user.displayName),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network('http://ojsfile.ohmynews.com/STD_IMG_FILE/2014/0829/IE001748429_STD.jpg', fit: BoxFit.cover,),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network('http://cfile202.uf.daum.net/R400x0/2142113F53CE18C3208CF5', fit: BoxFit.cover,),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network('https://t1.daumcdn.net/liveboard/petnu/d4b8e2a5947f40679546db3fe1126e6e.JPG', fit: BoxFit.cover,),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                          Text('페이스북 친구'),
                          Padding(padding: EdgeInsets.all(4.0)),
                          RaisedButton(
                              child: Text('팔로우'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: (){},
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
