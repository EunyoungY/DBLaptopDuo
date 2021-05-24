import 'package:flutter/material.dart';
import 'package:laptop_duo/duo_appbar.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DuoAppBar('맞춤형검색'),
        body: Column(
          children: [
            Row(
              children: [
                Text("x버튼을 누르면 이전페이지로 돌아갑니다."),
                IconButton(
                    icon: Icon(Icons.cancel_outlined),
                    iconSize: 24,
                    color: Colors.black54,
                    onPressed: () {
                      Navigator.pop(context);


                    }),
              ],
            ),

            SizedBox(
                height: 100
            ),


            Text("여기는 필터페이지")


          ],
        )
    );
  }
}