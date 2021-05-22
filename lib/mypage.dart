import 'package:flutter/material.dart';

import 'duo_appbar.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DuoAppBar('마이페이지'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            // submitField(user)
          ],
        ),
      ),
    );
  }
}