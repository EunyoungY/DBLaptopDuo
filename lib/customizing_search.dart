import 'package:flutter/material.dart';
import 'filter.dart';
import 'product_info.dart';

class CustomizingSearch extends StatefulWidget {
  @override
  _CustomizingSearchState createState() => _CustomizingSearchState();
}

class _CustomizingSearchState extends State<CustomizingSearch> {
  String dropdownValue = '낮은가격순';
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 100,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: ' 검색어를 입력하세요',
                  hintStyle: TextStyle(fontSize: 15),
                ),
                controller: _searchController,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
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
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.import_export),
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
                  items: <String>['낮은가격순','높은가격순']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(fontSize:14)),
                    );
                  }).toList(),
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
            SizedBox(height: 20),
            // Container(
            //   width: 300,
            //   child: InkWell(
            //       child: Image.network('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (BuildContext context) =>ProductInfo() ));
            //       }),
            // ),
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
            itemBuilder: (context, index){
              return Card(
                margin: EdgeInsets.all(4.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 6.0, bottom: 2.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${index+1}', style: TextStyle(fontSize: 15, color: Colors.black),),
                        Column(
                          children: [
                            Container(
                                width: 150,
                                height: 100,
                                child: InkWell(
                                    child: Image.network('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>ProductInfo() ));
                                    }),
                            ),
                            Text('MacBook Air'),
                            Text('1,166,600원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('리뷰 27'),
                          ],
                        ),
                      ],
                    )
                ),
              );
            },
          ),
        ),
          ],
        ),
      )
    );
  }
}