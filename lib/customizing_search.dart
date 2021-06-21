import 'package:flutter/material.dart';
import 'package:laptop_duo/search.dart';
import 'filter.dart';
import 'mysql.dart';
import 'product_info.dart';
import 'package:intl/intl.dart';

var db = new Mysql();

class CustomizingSearch extends StatefulWidget {
  @override
  _CustomizingSearchState createState() => _CustomizingSearchState();
}

class _CustomizingSearchState extends State<CustomizingSearch> {
  String dropdownValue = '낮은가격순';
  // TextEditingController _searchController = TextEditingController();
  var f = NumberFormat('###,###,###,###');

  var model_num = [];
  var model_name = [];
  var laptop_price = [];
  var image_url = [];
  var review_count = [];
  var model_num_desc = [];
  var model_name_desc = [];
  var laptop_price_desc = [];
  var image_url_desc = [];
  var review_count_desc = [];
  bool asc = true;

  @override
  Widget build(BuildContext context) {
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;
    db.getConnection().then((conn) {
      String sql = ('select model_num,model_name, laptop_price, review_count from dbfinal.laptop_image_review_asc');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            model_num.add(row[0].toString());
            model_name.add(row[1]);
            laptop_price.add(row[2]);
            review_count.add(row[3].toString());
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql = ('select image_url from dbfinal.laptop_image_review_asc');
      conn.query(sql).then((results) {
        for(var row in results){
          var temp = row[0].replaceAll('http','https');
          setState(() {
            image_url.add(temp);
          });
        }
      });
      conn.close();
    });
    //asc
    //---------------
    //desc
    db.getConnection().then((conn) {
      String sql = ('select model_num,model_name, laptop_price, review_count from dbfinal.laptop_image_review_desc');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            model_num_desc.add(row[0].toString());
            model_name_desc.add(row[1]);
            laptop_price_desc.add(row[2]);
            review_count_desc.add(row[3].toString());
          });
        }
      });
      conn.close();
    });

    db.getConnection().then((conn) {
      String sql = ('select image_url from dbfinal.laptop_image_review_desc');
      conn.query(sql).then((results) {
        for(var row in results){
          var temp = row[0].replaceAll('http','https');
          setState(() {
            image_url_desc.add(temp);
          });
        }
      });
      conn.close();
    });


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Divider(thickness: 2,),
           // SizedBox(height: 20),
            // Row(
            //   children: [
            //     SizedBox(width: 80),
            //     Container(
            //       width: 200,
            //       height: 100,
            //       child: TextFormField(
            //         decoration: InputDecoration(
            //           hintText: ' 검색어를 입력하세요',
            //           hintStyle: TextStyle(fontSize: 15),
            //         ),
            //         controller: _searchController,
            //         style: TextStyle(fontSize: 20, color: Colors.black),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(bottom: 30.0),
            //       child: IconButton(icon: Icon(Icons.search), onPressed:(){
            //         showSearch(context: context, delegate: DataSearch());
            //       }),
            //     )
            //   ],
            // ),
            // Row(
            //  children: [
            //    SizedBox(width:30),
            //    Text('검색결과 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            //    Text(' 4,290', style: TextStyle(color:Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 15)),
            //   ],
            // ),
            // SizedBox(height: 20),
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
                      orderPrice(newValue);
                      a=0;b=0;c=0;d=0;e=0;
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

            Divider(thickness: 2,),
            SizedBox(height: 20),
         asc == true ?
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 50,
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
                                    child: Image.network(image_url.isEmpty ? ' ' : image_url[a++]), //'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>ProductInfo(model_num[index], "1") ));
                                    }),
                            ),
                            Container(width : 100, child: Text(model_name.isEmpty ? ' ' : model_name[c++], overflow: TextOverflow.ellipsis)),
                            Text(laptop_price.isEmpty ? ' ' :f.format(laptop_price[d++]).toString()+'원', overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(review_count.isEmpty ? ' ' :'리뷰 ${review_count[e++]}',overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ],
                    )
                ),
              );
            },
          ),
         ) :
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 50,
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
                                  child: Image.network(image_url_desc.isEmpty ? ' ' : image_url_desc[a++]), //'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>ProductInfo(model_num_desc[index], "1") ));
                                  }),
                            ),
                            Container(width : 100, child: Text(model_name_desc.isEmpty ? ' ' : model_name_desc[c++], overflow: TextOverflow.ellipsis)),
                            Text(laptop_price_desc.isEmpty ? ' ' :f.format(laptop_price_desc[d++]).toString()+'원', overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(review_count_desc.isEmpty ? ' ' :'리뷰 ${review_count_desc[e++]}',overflow: TextOverflow.ellipsis,),
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
  void orderPrice(String value) {
    switch (value) {
      case '낮은가격순':
        asc = true;
        break;
      case '높은가격순':
        asc = false;
        break;
    }
  }
}

class DataSearch extends SearchDelegate<String>{
  final model = [];
  final model_num = [];

  final recentmodel = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear), onPressed:(){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,), onPressed:(){
      close(context,null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    //return ProductInfo(model_num[index],'1');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    db.getConnection().then((conn) {
      String sql = ('select model_name from dbfinal.model_name');
      conn.query(sql).then((results) {
        for(var row in results){
          //setState(() {
            model.add(row[0]);
          //});
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql = ('select model_num from dbfinal.model_name');
      conn.query(sql).then((results) {
        for(var row in results){
          //setState(() {
          model_num.add(row[0].toString());
          //});
        }
      });
      conn.close();
    });

    final suggestionList = query.isEmpty? recentmodel:model.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){//showResults(context);
          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>ProductInfo(model_num[index], "1") ));
        },
        title: RichText(text:TextSpan(text:suggestionList[index].substring(0,query.length),
            style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
        children: [TextSpan(
          text: suggestionList[index].substring(query.length),
          style: TextStyle(color: Colors.grey)
        )])),
      ),
      itemCount: suggestionList.length,
    );
  }
}