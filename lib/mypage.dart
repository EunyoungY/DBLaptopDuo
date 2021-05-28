import 'package:flutter/material.dart';

import 'duo_appbar.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController _textController = TextEditingController();
  String dropdownValue = '전산전자공학부';
  
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
            Padding(
              padding: EdgeInsets.fromLTRB(100,100,100,30),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://blog.kakaocdn.net/dn/LPgf9/btqDlNI4E2s/8MqQJTERKW0xtvCR7vgqv1/img.jpg'
                        ),
                        fit: BoxFit.cover
                    ),
                    shape: BoxShape.circle
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(70,0,10,0),
              child: Row(
                children: [
                  Text('이름',style: TextStyle(fontSize: 25),),
                  SizedBox(width: 10),
                  Container(
                    width: 150,
                    height: 30,
                    child: TextFormField(
                      controller: _textController,
                      style: TextStyle(fontSize: 20),
                    ),
                    ),
                  ],
                ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(70,0,10,0),
              child: Row(
                children: [
                  Text('전공',style: TextStyle(fontSize: 25),),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['전산전자공학부', '기계제어공학부', '생명과학부', '국제어문학부', '커뮤니케이션학부', 'ICT창업학부',
                      '콘텐츠융합디자인학부', '공간환경시스템학부', '경영경제학부', '상담심리학부', '법학부']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(fontSize: 20),),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            // submitField(user)
          ],
        ),
      ),
    );
  }
}