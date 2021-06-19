import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'duo_appbar.dart';
import 'mysql.dart';

class MajorRankingPage extends StatefulWidget {
  final String major;

  MajorRankingPage(this.major);

  @override
  _MajorRankingPageState createState() => _MajorRankingPageState();
}

class _MajorRankingPageState extends State<MajorRankingPage> {


  //  int _counter = 0;
  var db =  Mysql();
  var mail;
  var laptop_info = [];

  // var results= await conn.query(
  // 'select name, email, age from users where id = ?', [result.insertId]);
  // for (var row in results) {
  // print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  // }


  @override
  Widget build(BuildContext context) {
    db.getConnection().then((conn) {

      // String sql = ('select model_name from dbfinal.major_laptop_max where major=${widget.major}');
      String sql = ('select * from dbfinal.major_laptop_max');
      // String sql = ('select model_num from dbfinal.cart where user_num = 1');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            laptop_info.add(row[0]);
          });

        }
      });
      conn.close();
    });

    // db.getConnection().then((conn) {
    //   String sql = 'select C2 from laptopDUO.laptopDUO_model_name';
    //   conn.query(sql).then((results) {
    //     for(var row in results){
    //       setState(() {
    //         mail = row[0];
    //       });
    //     }
    //   });
    //   conn.close();
    // });

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: DuoAppBar("전공별랭킹"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: const Color(0xff421F90),
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: widget.major, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          TextSpan(text: '학생들이'),
                        ],
                      ),
                    ),

                    Text('가장 많이 사용하는 노트북', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                )
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     icon: Icon(Icons.arrow_back_ios),
                  //     iconSize: 24,
                  //     color: Colors.black54,
                  //     onPressed: () {
                  //       setState(() {
                  //         // _selectedIndex = 0;
                  //       });
                  //     }),
                  Center(
                    child: Container(
                        height: 200,
                        width: 270,
                        child: Image.network(
                          'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
                        )),
                  ),
                  // IconButton(
                  //     icon: Icon(Icons.arrow_forward_ios_outlined),
                  //     iconSize: 24,
                  //     color: Colors.black54,
                  //     onPressed: () {
                  //       setState(() {
                  //         // _selectedIndex = 0;
                  //       });
                  //     }),
                ],
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Container(width: 100,child: Text(laptop_info.isEmpty? ' ': laptop_info[0])),
                  // Container(width: 100,child: Text(laptop_info.isEmpty? ' ': laptop_info[0], overflow: TextOverflow.ellipsis,)),

                  // Center(child: Text('${mail}', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),

                  // Text('${mail}', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),


                  SizedBox(height: 30),
                  Text('최저가', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('1,500,000', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),

                  Text('운영체제', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Windows 10 Home ', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),

                  Text('프로세서', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('i7-1165G7 Processor', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),

                  Text('저장장치', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('1 TB', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}