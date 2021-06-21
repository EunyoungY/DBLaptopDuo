import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  var model_name = [];
  var os_name = [];
  var processor_name = [];
  var storage_capacity= [];
  var price = [];
  var url = [];


  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    db.getConnection().then((conn) {
      String sql = ('select * from dbfinal.major_laptop_max' );
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            if(row[0] == widget.major) {
              laptop_info.add(row[3]);
              model_name.add(row[2]);
              os_name.add(row[10]);
              processor_name.add(row[6]);
              storage_capacity.add(row[9]);
              price.add(row[3]);
              var temp = row[16].replaceAll('http', 'https');
              url.add(temp);
            }
          });
        }
      });
      conn.close();
    });


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
                  Center(
                    child: Container(
                        height: 200,
                        width: 270,
                        // child: Image.network(
                        //   'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
                        // )
                      child: Image.network(
                          url.isEmpty?'https://mblogthumb-phinf.pstatic.net/MjAxNzEyMThfMjQ1/MDAxNTEzNjA3MTcwNTg4.f9D3x971p8iDr_ox3nOQZmp2bHHA3YEtAvWI6-Zq6aAg.1E7HSp02TKDPZwC1wdciQdKiMEEzo0TvuY0ts5OmK4Mg.PNG.ooza-/IMG_9198.PNG?type=w800': url[0]
                      )


                    ),
                  ),
                ],
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25,0,25,0),
                    child: Center(child: Text(model_name.isEmpty? ' ':model_name[0], style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 18, fontWeight: FontWeight.bold)),),
                  ),

                  // Container(width: 100,child: Text(laptop_info.isEmpty? ' ': laptop_info[0])),

                  SizedBox(height: 30),
                  Text('최저가', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  // Text(price.toString().isEmpty?' ': price[0] , style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  Text(price.isEmpty? ' ':f.format(price[0]).toString()+"원", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),

                  Text('운영체제', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(os_name.isEmpty?' ': os_name[0] , style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),

                  Text('프로세서', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(processor_name.isEmpty? ' ': processor_name[0], style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                  SizedBox(height: 10),

                  Text('저장장치', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(storage_capacity.isEmpty? ' ': storage_capacity[0], style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
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