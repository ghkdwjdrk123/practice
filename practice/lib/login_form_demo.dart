import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(RowColumnDemo());

class RowColumnDemo extends StatelessWidget {
  static const String _title = "Naver Blog Log In";

  void onClick() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: Text(_title)),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Hero(
                  tag: 'heoro',
                  child: CircleAvatar(
                    child: Image.asset('assets/image/naver_blog.png'),
                    backgroundColor: Color(0xFFff00ff),
                    radius: 70.0,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue: 'your_name@naver.com',
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    // keyboardType: TextInputType.visiblePassword,
                    initialValue: 'input password',
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                      child: Text('Log in'),
                      onPressed: () {},
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text('Cancel'),
                      onPressed: () {exit(0);},
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
