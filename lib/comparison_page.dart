import 'package:flutter/material.dart';
import 'package:laptop_duo/duo_appbar.dart';
import 'mysql.dart';

class ComparisonPage extends StatefulWidget {
  final String model_num1;
  final String model_num2;

  ComparisonPage(this.model_num1, this.model_num2);

  @override
  _ComparisonPageState createState() => _ComparisonPageState(model_num1, model_num2);
}

class _ComparisonPageState extends State<ComparisonPage> {
  final String model_num1;
  final String model_num2;

  _ComparisonPageState(this.model_num1, this.model_num2);

  var db = Mysql();

  //model1
  var image_m1 = '';
  var model_name_m1 = "unknown";
  var manufacturer_m1 = "unknown";
  var date_m1 = "unknown";
  var price_m1 = "unknown";
  var os_m1 = "unknown";
  var processor_m1 = "unknown";
  var memory_m1 = "unknown";
  var storage_m1 = "unknown";
  var resolution_m1 = "unknown";
  var battery_m1 = "unknown";
  var thick_m1 = '0';
  var size_m1 = '0';
  var weight_m1 = '0';
  var usage_m1 = "unknown";

  //model2
  var image_m2 = '';
  var model_name_m2 = "unknown";
  var manufacturer_m2 = "unknown";
  var date_m2 = "unknown";
  var price_m2 = "unknown";
  var os_m2 = "unknown";
  var processor_m2 = "unknown";
  var memory_m2 = "unknown";
  var storage_m2 = "unknown";
  var resolution_m2 = "unknown";
  var battery_m2 = "unknown";
  var thick_m2 = '0';
  var size_m2 = '0';
  var weight_m2 = '0';
  var usage_m2 = "unknown";


  @override
  Widget build(BuildContext context) {

    db.getConnection().then((conn) {    //price, thickness(mm), screen_size(inch), weight(kg)
      String sql = ('select model_name, manufacturer, date_of_manufacture, processor_description, battery_capacity, memory_capacity, storage_capacity, os_name, resolution_info, usage_info, image_url, thickness_mm, screen_size_inch, weight_kg from dbfinal.laptop_info_all where model_num = ' + model_num1);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            model_name_m1 = row[0];
            manufacturer_m1 = row[1];
            date_m1 = row[2];
            processor_m1 = row[3];
            battery_m1 = row[4];
            memory_m1 = row[5];
            storage_m1 = row[6];
            os_m1 = row[7];
            resolution_m1 = row[8];
            usage_m1 = row[9];
            image_m1 = row[10].replaceAll('http', 'https');

            thick_m1 = row[11].toString();
            size_m1 = row[12].toString();
            weight_m1 = row[13].toString();
          });
        }
      });

      sql = ('select model_name, manufacturer, date_of_manufacture, processor_description, battery_capacity, memory_capacity, storage_capacity, os_name, resolution_info, usage_info, image_url, thickness_mm, screen_size_inch, weight_kg from dbfinal.laptop_info_all where model_num = ' + model_num2);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            model_name_m2 = row[0];
            manufacturer_m2 = row[1];
            date_m2 = row[2];
            processor_m2 = row[3];
            battery_m2 = row[4];
            memory_m2 = row[5];
            storage_m2 = row[6];
            os_m2 = row[7];
            resolution_m2 = row[8];
            usage_m2 = row[9];
            image_m2 = row[10].replaceAll('http', 'https');

            thick_m2 = row[11].toString();
            size_m2 = row[12].toString();
            weight_m2 = row[13].toString();
          });
        }
      });

      sql = ('select laptop_price from dbfinal.laptop_price where dbfinal.laptop_price.model_num = ' + model_num1);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            price_m1 = row[0].toString();
          });
        }
      });

      sql = ('select laptop_price from dbfinal.laptop_price where dbfinal.laptop_price.model_num = ' + model_num2);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            price_m2 = row[0].toString();
          });
        }
      });

      conn.close();
    });


    return Scaffold(
      appBar: DuoAppBar('비교분석'),
        body: Table(
          /*border: TableBorder.all(
            width: 0.4,
            color: Colors.grey[400],
          ),*/
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FixedColumnWidth(160),
            2: FixedColumnWidth(160)
          },
          children: [

            TableRow( /*  이미지 */
              children: <Widget>[
                Container(
                    height: 120,
                    width: 80,
                ),
                Container(
                    height: 120,
                    width: 160,
                    padding: EdgeInsets.all(25),
                    child: Image.network(image_m1)
                ),
                Container(
                    height: 120,
                    width: 160,
                    padding: EdgeInsets.all(25),
                    child: Image.network(image_m2)
                ),
              ]
            ),
            TableRow( /*  모델명 */
                children: <Widget>[
                  Container(
                      height: 10,
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        model_name_m1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C),
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        model_name_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow(
                children: <Widget>[
                  Container(
                    height: 10,
                  ),Container(
                    height: 10,
                  ),Container(
                    height: 10,
                  ),
                ]
            ),
            TableRow( /*  제조사 */
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(7),
                  child: Text(
                    '제조사',
                    style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff666666)
                    ),
                  )
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Text(
                      manufacturer_m1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color(0xff2C2C2C)
                      ),
                    )
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Text(
                      manufacturer_m2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color(0xff2C2C2C)
                      ),
                    )
                ),
              ]
            ),
            TableRow( /*  제조년월  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '제조년월',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        date_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        date_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  최저가  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '최저가',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        price_m1 +' 원',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        price_m2 +' 원',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  운영체제  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '운영체제',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        os_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        os_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  프로세서  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '프로세서',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        processor_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        processor_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  메모리  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '메모리',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        memory_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        memory_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  저장장치  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '저장장치',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        storage_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        storage_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  디스플레이  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '디스플레이',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        resolution_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        resolution_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  배터리 */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '배터리',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        battery_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        battery_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  두께  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '두께',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        thick_m1 +' mm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        thick_m2 +' mm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  크기  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '크기',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        size_m1 +' inch',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        size_m2 +' inch',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  무게  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '무게',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        weight_m1 +' kg',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        weight_m2 + ' kg',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  용도  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '용도',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        usage_m1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        usage_m2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
          ],
        )
    );
  }
}