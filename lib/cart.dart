import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'mysql.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CarouselController buttonCarouselController = CarouselController();
  var db =  Mysql();
  var cnt_cart = 0;
  var myList = [];
  var price = [];
  var os = [];
  var processor = [];
  var ssd = [];
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    cnt_cart = 0;
    db.getConnection().then((conn) {
        String sql = ('select model_num from dbfinal.cart where user_num = 1');
        conn.query(sql).then((results) {
          for (var row in results) {
            setState(() {
              cnt_cart++;
            });
          }
        });

       sql = ('select model_name from dbfinal.cart, dbfinal.model_name where user_num = 1 and dbfinal.cart.model_num=dbfinal.model_name.model_num');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            myList.add(row[0]);
          });

        }
      });

      sql = ('select laptop_price from dbfinal.cart, dbfinal.price where user_num = 1 and dbfinal.cart.model_num=dbfinal.price.model_num');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            price.add(row[0]);
          });

        }
      });

      sql = ('select os_name from dbfinal.cart, dbfinal.os where user_num = 1 and dbfinal.cart.model_num=dbfinal.os.model_num');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            os.add(row[0]);
          });
        }
      });

      sql = ('select processor_description from dbfinal.cart, dbfinal.processor where user_num = 1 and dbfinal.cart.model_num=dbfinal.processor.model_num');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            processor.add(row[0]);
          });
        }
      });

      sql = ('select storage_capacity from dbfinal.cart, dbfinal.storage_device where user_num = 1 and dbfinal.cart.model_num=dbfinal.storage_device.model_num');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            ssd.add(row[0]);
          });
        }
      });

      conn.close();
    });

    return Scaffold(
      body: CarouselSlider.builder(
        options: CarouselOptions(
          // autoPlay: true,
          aspectRatio: 0.56,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        itemCount: cnt_cart,
        itemBuilder: (context, itemIndex, realIndex)
        {
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              Image.network('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,0,0),
                child: Center(child: Text(myList.isEmpty? ' ':myList[itemIndex], style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 18, fontWeight: FontWeight.bold)),),
              ),
              SizedBox(height: 60,),

              Text('최저가', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(price.isEmpty? ' ':f.format(price[itemIndex]).toString()+"원", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
              SizedBox(height: 13),

              Text('운영체제', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(os.isEmpty? ' ':os[itemIndex]??" ", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
              SizedBox(height: 13),

              Text('프로세서', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(processor.isEmpty? ' ':processor[itemIndex]??" ", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
              SizedBox(height: 13),

              Text('저장장치', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(ssd.isEmpty? ' ':ssd[itemIndex].toString()??" ", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
              SizedBox(height: 13),
            ],
          );
          // return Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(myList[itemIndex].toString()),
          // );
        },
      )
    );
  }


}