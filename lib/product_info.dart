import 'package:flutter/material.dart';
import 'package:laptop_duo/comparison_page.dart';
import 'package:laptop_duo/duo_appbar.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

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
                          child: Image.network(
                            'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
                          )),
                    ),
                  ],
                ),
              ),

              Center(child: Text('MacBook Air', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))),


              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.redAccent[100],),
                // iconSize: 24, color: Colors.black54,

                // onPressed: ()  {
                //   setState(() {
                //     isFavorite = !isFavorite;
                //     print(isFavorite);
                //   });
                // }

                onPressed: () => {
                  setState(() {
                    isFavorite = !isFavorite;
                    print(isFavorite);
                  })
                },

              ),




              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                ),
              ),

              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),


                  IconButton(
                    icon: Icon(Icons.art_track_rounded),
                    iconSize: 24,
                    color: Colors.amber,
                    onPressed: () async {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,

                        builder: (BuildContext context) {
                          return _popUpAddDrug(context);
                        },

                      );},),
                  Text("비교분석하기"),

                  SizedBox(
                      height: 300
                  ),



                ],
              )


            ],
          ),
        ),
    );
  }

  Widget _popUpAddDrug(context) {
    return Container(
      //color: yellow,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(12.0),
            topRight: const Radius.circular(12.0),
          )),
      child: Wrap(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height  ,
            child: Column(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.laptop_chromebook),
                    iconSize: 24,
                    color: Colors.black54,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>ComparisonPage() ));
                    }),

                Text("비교하기버튼")





             ],
            ),
          ),
        ],
      ),
    );
  }

}