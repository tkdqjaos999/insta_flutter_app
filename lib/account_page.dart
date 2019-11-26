import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int _postCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('post').where('email', isEqualTo: widget.user.email)
    .getDocuments()
    .then((snapShot){
      setState(() {
        _postCount = snapShot.documents.length;
      });
    });
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
            },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 27,
                          height: 27,
                          child: FloatingActionButton(
                            child: Icon(Icons.add,),
                            onPressed: (){},
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            child: Icon(Icons.add,),
                            onPressed: (){},
                            backgroundColor: Colors.blueAccent,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text(widget.user.displayName, style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
            ],
          ),
          Text('$_postCount\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text('0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text('0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
