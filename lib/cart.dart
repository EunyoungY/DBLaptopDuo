import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // body: Padding(
      //   padding: EdgeInsets.fromLTRB(8, 16, 16, 0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       SizedBox(
      //         height: 50,
      //       ),
      //       // submitField(user)
      //     ],
      //   ),
      // ),


      // body: Column(
      //     children: <Widget>[
      //       CarouselSlider(
      //         // items: child,
      //         items: [Image.network(
      //           'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
      //         )],
      //         carouselController: buttonCarouselController,
      //         options: CarouselOptions(
      //           autoPlay: false,
      //           enlargeCenterPage: true,
      //           viewportFraction: 0.9,
      //           aspectRatio: 2.0,
      //           initialPage: 2,
      //         ),
      //       ),
      //       RaisedButton(
      //         onPressed: () => buttonCarouselController.nextPage(
      //             duration: Duration(milliseconds: 300), curve: Curves.linear),
      //         child: Text('→'),
      //       )
      //     ]
      // )

      body: Container(
          child: Column(children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                // autoPlay: true,
                aspectRatio: 0.7,
                enlargeCenterPage: true,
              ),
              items: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20,),
                    Image.network('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',),
                    SizedBox(height: 20,),
                    Center(child: Text('MacBook Air', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))),
                    SizedBox(height: 30,),

                    Text('최저가', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Text('1,500,000', style: TextStyle(color: Colors.black, fontSize: 14)),
                    SizedBox(height: 10),

                    Text('운영체제', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Text('Windows 10 Home ', style: TextStyle(color: Colors.black, fontSize: 14)),
                    SizedBox(height: 10),

                    Text('프로세서', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Text('i7-1165G7 Processor', style: TextStyle(color: Colors.black, fontSize: 14)),
                    SizedBox(height: 10),

                    Text('저장장치', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Text('1 TB', style: TextStyle(color: Colors.black, fontSize: 14)),
                    SizedBox(height: 10),
                  ],
                )

              ],
            ),
          ],))




    );
  }


}