import 'package:flutter/material.dart';
import 'filter.dart';
import 'product_info.dart';

class CustomizingSearch extends StatefulWidget {
  @override
  _CustomizingSearchState createState() => _CustomizingSearchState();
}

class _CustomizingSearchState extends State<CustomizingSearch> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Row(
           children: [
             SizedBox(width:30),
             Text('검색결과 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
             Text(' 4,290', style: TextStyle(color:Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 15)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width:50),
              Text('정확도순'),
              IconButton(
                icon: Icon(Icons.import_export),
                iconSize: 24,
                color: Colors.black54,
                onPressed: () {}
              ),
              SizedBox(width:120),
              Text('필터'),
              IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  iconSize: 24,
                  color: Colors.black54,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>Filter() ));
                  }),
            ],
          ),
          SizedBox(height: 100),
          IconButton(
              icon: Icon(Icons.laptop_chromebook),
              iconSize: 24,
              color: Colors.black54,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>ProductInfo() ));
              }),
          Text("제품 상세 페이지로 가는 버튼"),
        ],
      )
    );
  }
}