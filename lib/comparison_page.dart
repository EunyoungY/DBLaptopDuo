import 'package:flutter/material.dart';
import 'package:laptop_duo/duo_appbar.dart';

class ComparisonPage extends StatefulWidget {
  @override
  _ComparisonPageState createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DuoAppBar('비교분석'),
        body: Column(
          children: [
            Row(
              children: [
              ],
            ),

            SizedBox(
                height: 100
            ),


            Text("여기는 비교분석페이지")




          ],
        )
    );
  }
}