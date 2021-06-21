import 'package:flutter/material.dart';
import 'package:laptop_duo/comparison_page.dart';
import 'package:laptop_duo/duo_appbar.dart';
import 'mysql.dart';

class ProductInfo extends StatefulWidget {
  final String model_num;
  final String user_num;

  ProductInfo(this.model_num, this.user_num);

  @override
  _ProductInfoState createState() => _ProductInfoState(model_num, user_num);
}



class _ProductInfoState extends State<ProductInfo> {
  final String model_num;
  final String user_num;

  _ProductInfoState(this.model_num, this.user_num);

  var db = Mysql();

  //product info
  var image = '';
  var model_name = "unknown";
  var in_cart = 0;   //isFavorite
  var manufacturer = "unknown";
  var date = "unknown";
  var price = "0";
  var os = "unknown";
  var processor = "unknown";
  var memory = "unknown";
  var storage = "unknown";
  var resolution = "unknown";
  var battery = "unknown";
  var thick = '0';
  var size = '0';
  var weight = '0';
  var usage = "unknown";

  //review info
  var pro_review_num = 0;  //number of the product review
  var user_name = [];
  var major = [];
  var rating = [];
  var review_content = [];
  var last_review_num = 0;

  //popup
  var cart_image_num = 0;
  var cart_model_name = [];
  var cart_image = [];
  var cart_model_num =[];

  var my_rating = 1;
  var my_review_num = 1;
  var isFavorite = true;

  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    db.getConnection().then((conn) {    //thickness(mm), screen_size(inch), weight(kg)
      String sql = ('select model_name, manufacturer, date_of_manufacture, processor_description, battery_capacity, memory_capacity, storage_capacity, os_name, resolution_info, usage_info, image_url, thickness_mm, screen_size_inch, weight_kg from dbfinal.laptop_info_all where model_num = ' + model_num);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            model_name = row[0];
            manufacturer = row[1];
            date = row[2];
            processor = row[3];
            battery = row[4];
            memory = row[5];
            storage = row[6];
            os = row[7];
            resolution = row[8];
            usage = row[9];
            image = row[10].replaceAll('http', 'https');

            thick = row[11].toString();
            size = row[12].toString();
            weight = row[13].toString();
          });
        }
      });

      sql = ('select laptop_price from dbfinal.laptop_price where dbfinal.laptop_price.model_num = ' + model_num);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            price = row[0].toString();
          });
        }
      });

      sql = ('select user_name, major, rating, review_content from dbfinal.user natural join dbfinal.review where dbfinal.review.model_num = ' + model_num);
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            pro_review_num = results.length;
            user_name.add(row[0]);
            major.add(row[1]);
            rating.add(row[2]);
            review_content.add(row[3]);
          });
        }
      });

      sql = ('select model_name, image_url, model_num from dbfinal.cart natural join dbfinal.laptop_image natural join dbfinal.model_name where dbfinal.cart.user_num = ' + user_num.toString());
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            cart_image_num = results.length;
            cart_model_name.add(row[0]);
            var temp = row[1].replaceAll('http', 'https');
            cart_image.add(temp);
            cart_model_num.add(row[2]);
          });
        }
      });

      sql = ('select model_num from dbfinal.cart where dbfinal.cart.model_num = ' + model_num.toString());
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            in_cart = results.length;
          });
        }
      });

      sql = sql = ('select max(review_num) from dbfinal.review');
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            last_review_num = row[0];
          });
        }
      });

      conn.close();
    });


    my_review_num = last_review_num + 1;

    if(in_cart == 0) isFavorite = false;
    else isFavorite = true;


    return Scaffold(
        appBar: DuoAppBar('상세스펙'),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ListView(
            children: [

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
                          child: Image.network(image)),
                    ),
                  ],
                ),
              ),


              Center(
                  child: Text(
                      model_name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),


              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.redAccent[100],
                ),

                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    //print(isFavorite);

                    if(isFavorite) {
                      db.getConnection().then((conn) {
                          String sql = ('insert into dbfinal.cart values(' + user_num + ', ' + model_num + ')');
                          conn.query(sql).then((results) {
                            //for (var row in results) {
                              //setState(() {
                                //print("insert success");
                              //});
                            //}
                          });
                        conn.close();
                      });
                      //isFavorite = false;
                      _popDialog('Cart', "찜한 상품에 추가되었습니다.");
                    }else{
                      db.getConnection().then((conn) {
                        String sql = ('delete from dbfinal.cart where model_num=' + model_num +' and user_num = ' + user_num );
                        conn.query(sql).then((results) {
                          //for (var row in results) {
                            //setState(() {
                              //print("delete success");
                            //});
                          //}
                        });
                        conn.close();
                      });
                      //isFavorite = true;
                      _popDialog("Cart", "찜한 상품에 삭제되었습니다.");
                    }
                    //_cartDialog();
                  });
                },

              ),


              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('제조사', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(manufacturer, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('제조년월', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(date, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('최저가', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(price +' 원', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('운영체제', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(os, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('프로세서', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(processor, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('메모리', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(memory, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('저장장치', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(storage, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('디스플레이', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(resolution, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('배터리', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(battery, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('두께', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(thick +' mm', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('크기', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(size + ' inch', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('무게', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(weight + ' kg', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('용도', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(usage, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Divider(thickness: 8, color: Colors.grey[200],),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("리뷰 작성", style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 16, fontWeight: FontWeight.bold)),
                    Container(
                        child: Row(
                            children: [
                              Text("       별점: ", style: TextStyle(fontSize:14),),
                              IconButton(
                                icon: Icon(
                                  my_rating >= 1 ? Icons.star : Icons.star_border,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                  onPressed: () {
                                    setState(() {
                                      my_rating = 1;
                                    });
                                  }
                              ),
                              IconButton(
                                  icon: Icon(
                                    my_rating >= 2 ? Icons.star : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      my_rating = 2;
                                    });
                                  }
                              ),
                              IconButton(
                                  icon: Icon(
                                    my_rating >= 3 ? Icons.star : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      my_rating = 3;
                                    });
                                  }
                              ),
                              IconButton(
                                  icon: Icon(
                                    my_rating >= 4 ? Icons.star : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      my_rating = 4;
                                    });
                                  }
                              ),
                              IconButton(
                                  icon: Icon(
                                    my_rating >= 5 ? Icons.star : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      my_rating = 5;
                                    });
                                  }
                              ),
                            ]
                        )
                    ),
                    TextField(
                      controller: reviewController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'review',
                      ),
                    ),
                    TextButton(
                      child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Submit"),
                      ),

                      onPressed: (){
                            db.getConnection().then((conn) {
                              String sql = ('insert into dbfinal.review(model_num, user_num, rating, review_content) values(' + model_num + ', ' + user_num + ', ' + my_rating.toString() + ', \'' + reviewController.text + '\')');
                              conn.query(sql).then((results) {
                                for (var row in results) {
                                  //setState(() {
                                  //  print("insert success");
                                  //});
                                }
                              });
                              conn.close();
                            });
                            //isFavorite = false;
                            _popDialog("Review", "리뷰가 추가되었습니다.");
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("상품리뷰", style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 16, fontWeight: FontWeight.bold)),

                    for(int i = 0; i < pro_review_num; i++) _buildReview(user_name[i], major[i], rating[i], review_content[i]),

                  ],
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 28,
                      width: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xff522AA3),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                      ),
                      child: Center(child: Text("한눈에 비교하고싶으신가요? ",  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold))),
                    ),

                    SizedBox(height: 10),
                    Text("Laptop Spec", style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 18),

                    Container(
                      height: 158,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBDCDD)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          IconButton(
                            icon: Icon(Icons.laptop_mac_sharp),
                            iconSize: 24,
                            color: const Color(0xff522AA3),
                            onPressed: () async {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return _popUpAddDrug(context);
                                },
                              );},),
                          Center(child: Text("고민된다면 비교하세요! ",  style: TextStyle(color: Colors.black87, fontSize: 14))),
                          SizedBox(height: 15),
                          GestureDetector(
                              onTap: () async {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _popUpAddDrug(context);
                                  },

                                );},
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.blueAccent),
                                // border: Border.all(color: Colors.blueAccent),
                                color: const Color(0xff434445),
                              ),
                              child: Center(child: Text("스펙 비교하기 >",  style: TextStyle(color: Colors.white, fontSize: 13,))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 300
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
    );
  }

  Widget _buildReview(String user_name, String major, int rating, String review_content){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,

      children:[
      SizedBox(height: 16,),
      Text(user_name, style: TextStyle(color: const Color(0xff666666), fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(height: 5,),
        Container(
            child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Icon(
                    rating >= 2 ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Icon(
                    rating >= 3 ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Icon(
                    rating >= 4 ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Icon(
                    rating == 5 ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 15,
                  ),
                ]
            )
        ),
        SizedBox(height: 5,),
      Text(major, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
      SizedBox(height: 5,),
      Text(review_content, style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
      SizedBox(height: 12,),
      Divider(thickness: 0.4, color: Colors.grey[400], ),
    ]
    );
  }

  //List<bool> _selections = [false, true];

  Widget _popUpAddDrug(context) {
    return Container(
      //color: yellow,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(12.0),
            topRight: const Radius.circular(12.0),
          )),
      child: Column(//Wrap(
        children: <Widget>[
          Expanded(
            //height: MediaQuery.of(context).size.height  ,
            child: ListView(//Column(
              children: <Widget>[
                Column(
            children: ListTile.divideTiles(
                  context: context,
                  tiles:[
                  ListTile(
                  title: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    child: Text(
                        '\'찜한 상품\'과 비교하기',
                        style: TextStyle(
                          fontSize: 20
                      )
                    ),
                  ),
                ),

                for(int i = 0; i < cart_image_num; i++) _buildTile(model_num, cart_model_num[i].toString(), cart_model_name[i], cart_image[i]),
                    ],
                ).toList(),
    )



              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(String model_num1, String model_num2, String name, String image){
    return ListTile(
      leading: Container(
          height: 150,
          width: 180,
          //padding: EdgeInsets.all(25),
          child: Image.network(image)
      ),
      title: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: const Color(0xff2C2C2C)
        ),
      ),
      subtitle: Container(
        width: 190,
        child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>ComparisonPage(model_num1, model_num2) ));
            },
            child: Text(
              "비교하기",
              style:TextStyle(color: const Color(0xff2C2C2C), fontSize: 13),
            )
        ),
      ),
    );
  }

  void _popDialog(String dia_title, String dia_content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dia_title),
          content: Text(dia_content),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]
        );
      }
    );
  }

}