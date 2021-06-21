import 'package:flutter/material.dart';
import 'package:laptop_duo/customizing_search_filter.dart';
import 'package:laptop_duo/duo_appbar.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> manufacturer = ['삼성전자','LG전자','레노버','Apple'];
  List<String> os = ['윈도우10','MacOS'];
  List<String> storage = ['256GB','512GB','1TB'];
  List<String> memory = ['4GB','8GB','16GB'];
  List<String> processor = ['코어i3-11세대','코어i5-11세대','코어i7-11세대'];
  List<String> price = ['1000000','2000000'];
  List<String> usage_info = ['사무용, 인강용','게임용, 그래픽작업용','기타'];


  List<String> laptop_manufacturer = [];
  List<String> laptop_os = [];
  List<String> laptop_storage = [];
  List<String> laptop_memory = [];
  List<String> laptop_processor = [];
  List<String> laptop_price = [];
  List<String> laptop_usage_info = [];


  List<bool> checked = [false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DuoAppBar('맞춤형검색'),
        body:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left:20, right:10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("필터", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Spacer(),
                    // IconButton(
                    //     icon: Icon(Icons.close),
                    //     iconSize: 30,
                    //     color: Colors.black54,
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     }),
                  ],
                ),
                SizedBox(height: 15),
                // Text('고객님께 제안하는 필터',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                // SizedBox(height: 5),
                // Row(
                //   children: [
                //     TextButton(
                //       child: Text('윈도우10',style: TextStyle(fontSize: 15),),
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.fromLTRB(10,0,10,0),
                //         primary: Colors.grey,
                //         shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
                //       ),
                //       onPressed: (){}, //TODO : 연동
                //     ),
                //     SizedBox(width: 10),
                //     TextButton(
                //       child: Text('맥북',style: TextStyle(fontSize: 15)),
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.fromLTRB(0,0,0,0),
                //         primary: Colors.grey,
                //         shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
                //       ),
                //       onPressed: (){},//TODO : 연동
                //     ),
                //     SizedBox(width: 10),
                //     TextButton(
                //       child: Text('256GB',style: TextStyle(fontSize: 15)),
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.fromLTRB(10,0,10,0),
                //         primary: Colors.grey,
                //         shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
                //       ),
                //       onPressed: (){},//TODO : 연동
                //     ),
                //   ],
                // ),
                ExpansionTile(
                  title: Text('제조사'),
                  children: <Widget>[
                    CheckboxGroup(
                      labels: <String>[
                        '삼성전자',
                        'LG전자',
                        '레노버',
                        'Apple'
                      ],
                      onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                    ),
                  ]
                ),
                ExpansionTile(
                    title: Text('운영체제'),
                   // initiallyExpanded: true,
                    children: <Widget>[
                      CheckboxGroup(
                        labels: <String>[
                          '윈도우10',
                          'MacOS'
                        ],
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                    ]
                ),
                ExpansionTile(
                    title: Text('저장장치'),
                    children: <Widget>[
                      CheckboxGroup(
                        labels: <String>[
                          '256GB',
                          '512GB',
                          '1TB'
                        ],
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                    ]
                ),
                ExpansionTile(
                    title: Text('메모리용량'),
                    children: <Widget>[
                      CheckboxGroup(
                        labels: <String>[
                          '4GB',
                          '8GB',
                          '16GB'
                        ],
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                    ]
                ),
                ExpansionTile(
                    title: Text('프로세서'),
                    children: <Widget>[
                      CheckboxGroup(
                        labels: <String>[
                          '코어 i3',
                          '코어 i5',
                          '코어 i7',
                        ],
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                    ]
                ),
                ExpansionTile(
                    title: Text('가격'),
                    children: <Widget>[
                      CheckboxGroup(
                        labels: <String>[
                          '100만원 미만',
                          '100만원~200만원 대',
                          '200만원 이상'
                        ],
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                    ]
                ),
                ExpansionTile(
                    title: Text('사용목적'),
                    children: <Widget>[
                      CheckboxGroup(
                        labels: <String>[
                          '사무용/인강용',
                          '게임용/그래픽작업용',
                          '기타'
                        ],
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                        ],
                ),
                SizedBox(height:30),
                Row(
                  children: [
                    SizedBox(width:30),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('뒤로 가기',style: TextStyle(fontSize: 15)),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30,10,30,10),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 1)),
                      ),
                    ),
                    SizedBox(width:30),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>CustomizingSearchFilter(manufacturer,os,storage, memory,processor,price,usage_info)
                              ));
                      },
                      child: Text('적용',style: TextStyle(fontSize: 15)),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(55,10,55,10),
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 1))
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}