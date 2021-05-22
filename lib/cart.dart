import 'package:flutter/material.dart';

import 'duo_appbar.dart';

class Comparison extends StatefulWidget {
  @override
  _ComparisonState createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DuoAppBar('비교분석'),
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