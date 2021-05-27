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
            TableRow(
                children: <Widget>[
                  Container(
                    height: 20,
                  ),Container(
                    height: 20,
                  ),Container(
                    height: 20,
                  ),
                ]
            ),
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
                    child: Image.network(
                      'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
                    )
                ),
                Container(
                    height: 120,
                    width: 160,
                    padding: EdgeInsets.all(25),
                    child: Image.network(
                      'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
                    )
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
                        '갤럭시북 Pro 360',
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
                        '갤럭시북 Flex',
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
            TableRow( /*  모델명 */
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(7),
                  child: Text(
                    '모델명',
                    style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff666666)
                    ),
                  )
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Text(
                      'NT950QDB-KD71N',
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
                      'NT950QDB-KD71N',
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
                        'Windows 10 Home ',
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
                        'Windows 10 Home ',
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
                        'i7-1165G7',
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
                        'i7-1165G7',
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
                        '16 GB',
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
                        '16 GB',
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
                        '1 TB',
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
                        '1 TB',
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
                        '15.6inch',
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
                        '15.6inch',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xff2C2C2C)
                        ),
                      )
                  ),
                ]
            ),
            TableRow( /*  색상  */
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '색상',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff666666)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(7),
                      child: Text(
                        '미스틱 네이비',
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
                        '미스틱 네이비',
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
                        '1.29kg',
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
                        '1.29kg',
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
        )/*Column(
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
        )*/
    );
  }
}