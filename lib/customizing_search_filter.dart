import 'package:flutter/material.dart';
import 'mysql.dart';
import 'product_info.dart';
import 'package:intl/intl.dart';

var db = new Mysql();

class CustomizingSearchFilter extends StatefulWidget {
  final List<String> laptop_manufacturer;
  final List<String> laptop_os;
  final List<String> laptop_storage;
  final List<String> laptop_memory ;
  final List<String> laptop_processor;
  final List<String> laptop_price;
  final List<String> laptop_usage_info;



  CustomizingSearchFilter(this.laptop_manufacturer,this.laptop_os,this.laptop_storage,this.laptop_memory,this.laptop_processor,this.laptop_price, this.laptop_usage_info);

  @override
  _CustomizingSearchFilterState createState() => _CustomizingSearchFilterState(laptop_manufacturer,laptop_os,laptop_storage,laptop_memory,laptop_processor,laptop_price,laptop_usage_info);
}

class _CustomizingSearchFilterState extends State<CustomizingSearchFilter> {
  final List<String> laptop_manufacturer;
  final List<String> laptop_os;
  final List<String> laptop_storage;
  final List<String> laptop_memory ;
  final List<String> laptop_processor;
  final List<String> laptop_price;
  final List<String> laptop_usage_info;

  _CustomizingSearchFilterState(this.laptop_manufacturer,this.laptop_os,this.laptop_storage,this.laptop_memory,this.laptop_processor,this.laptop_price, this.laptop_usage_info);

  var f = NumberFormat('###,###,###,###');

  var model_num = [];
  var model_name = [];
  var model_price = [];
  var image_url = [];
  var review_count = [];

  @override
  Widget build(BuildContext context) {
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;
    db.getConnection().then((conn) {
      String sql = ('select model_num from dbfinal.laptop_info_2 where manufacturer = \'${laptop_manufacturer[0]}\' and os_name= \'${laptop_os[0]}\'and storage_capacity= \'${laptop_storage[0]}\' and memory_capacity = \'${laptop_memory[0]}\' and processor_description = \'${laptop_processor[0]}\' and laptop_price < \'${laptop_price[0]}\' and usage_info = \'${laptop_usage_info[0]}\'');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            model_num.add(row[0].toString());
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql = ('select model_name from dbfinal.laptop_info_2 where manufacturer = \'${laptop_manufacturer[0]}\' and os_name= \'${laptop_os[0]}\'and storage_capacity= \'${laptop_storage[0]}\' and memory_capacity = \'${laptop_memory[0]}\' and processor_description = \'${laptop_processor[0]}\' and laptop_price < \'${laptop_price[0]}\' and usage_info = \'${laptop_usage_info[0]}\'');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            model_name.add(row[0]);
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql = ('select laptop_price from dbfinal.laptop_info_2 where manufacturer = \'${laptop_manufacturer[0]}\' and os_name= \'${laptop_os[0]}\'and storage_capacity= \'${laptop_storage[0]}\' and memory_capacity = \'${laptop_memory[0]}\' and processor_description = \'${laptop_processor[0]}\' and laptop_price < \'${laptop_price[0]}\' and usage_info = \'${laptop_usage_info[0]}\'');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            model_price.add(row[0]);
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql = ('select review_count from dbfinal.laptop_info_2 where manufacturer = \'${laptop_manufacturer[0]}\' and os_name= \'${laptop_os[0]}\'and storage_capacity= \'${laptop_storage[0]}\' and memory_capacity = \'${laptop_memory[0]}\' and processor_description = \'${laptop_processor[0]}\' and laptop_price < \'${laptop_price[0]}\' and usage_info = \'${laptop_usage_info[0]}\'');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            review_count.add(row[0].toString());
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql = ('select image_url from dbfinal.laptop_info_2 where manufacturer = \'${laptop_manufacturer[0]}\' and os_name= \'${laptop_os[0]}\'and storage_capacity= \'${laptop_storage[0]}\' and memory_capacity = \'${laptop_memory[0]}\' and processor_description = \'${laptop_processor[0]}\' and laptop_price < \'${laptop_price[0]}\' and usage_info = \'${laptop_usage_info[0]}\'');
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

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left : 20, right: 10),
                child: Row(
                  children: [
                    Text('검색 결과', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.close),
                        iconSize: 30,
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
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
                                       child: Image.network(image_url.isEmpty? '' : image_url[a++]),//'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) =>ProductInfo(model_num[index], "1") ));
                                        }),
                                  ),
                                 Container(width : 100, child: Text(model_name.isEmpty ? ' ' :model_name[c++], overflow: TextOverflow.ellipsis)),
                                  Text(model_price.isEmpty ? '가격' :f.format(model_price[d++]).toString()+'원', overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Text(review_count.isEmpty ? '리뷰' :'리뷰 ${review_count[e++]}',overflow: TextOverflow.ellipsis,),
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