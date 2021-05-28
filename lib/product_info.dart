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
                    Text('최저가', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('1,500,000', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('운영체제', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Windows 10 Home ', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('프로세서', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('i7-1165G7 Processor', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 10),

                    Text('저장장치', style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('1 TB', style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
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
                    Text("상품리뷰", style: TextStyle(color: const Color(0xff2C2C2C), fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16,),
                    Text("펭수", style: TextStyle(color: const Color(0xff666666), fontSize: 15, fontWeight: FontWeight.bold)),
                    Text("전산전자공학부", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 8,),
                    Text("화면이 넓고 무겁지 않아서 과제하기 딱이에요. 이 노트북이라면 코딩도 실험도 밤샘도 걱정없어요. *^^*",
                        style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 12,),
                    Divider(thickness: 0.4, color: Colors.grey[400], ),



                    SizedBox(height: 16,),
                    Text("뽀로로", style: TextStyle(color: const Color(0xff666666), fontSize: 15, fontWeight: FontWeight.bold)),
                    Text("콘텐츠융합디자인학부", style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 8,),
                    Text("이번에 3D 모델링 수업을 듣게 돼서 여러가지 소프트웨어를 설치해야 했는데 무리없이 잘 설치되더라구요~! 같은 삼섬 제품이다보니 제 갤럭시탭과 연동해서 과제를 이어나갈 수도 있어서 너무 좋아요. 콘디 후배님들에게도 이 제품을 추천합니다!",
                        style: TextStyle(color: const Color(0xff666666), fontSize: 14)),
                    SizedBox(height: 12,),
                    Divider(thickness: 0.4, color: Colors.grey[400], ),


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
                /*Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ToggleButtons(
                        color: Colors.black,
                        selectedColor: Colors.white70,
                        fillColor: Color(0xff421F90),

                        children: <Widget>[
                          Container(
                            width: 170,
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "구매 상품으로 비교",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 170,
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                                "찜한 상품으로 비교",
                                textAlign: TextAlign.center,
                            ),
                          ),
                        ],

                        onPressed: (int index){
                          setState(() {
                            for(int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++){
                              if(buttonIndex == index){
                                _selections[buttonIndex] = true;
                              } else{
                                _selections[buttonIndex] = false;
                              }
                            }
                          });
                        },
                        isSelected: _selections,
                      ),
                    ],
                  ),
                ),*/
                /*Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Container(
                          height: 130,
                          width: 180,
                          padding: EdgeInsets.all(25),
                          child: Image.network(
                            'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000',
                          )),
                      Container(
                          padding: EdgeInsets.all(5),
                          child:Column(
                            children: <Widget>[
                              Text(
                                "Mac Air",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: const Color(0xff2C2C2C)
                          ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 190,
                                child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>ComparisonPage() ));
                                    },
                                    child: Text(
                                      "비교하기",
                                      style:TextStyle(color: const Color(0xff2C2C2C), fontSize: 13),
                                    )
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),*/
                _buildTile("Mac Air", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile("Mac Pro", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile("Mac Air", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile('Mac Air4', 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile("Mac Air5", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile("Mac Air6", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile("Mac Air7", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
                _buildTile("Mac Air8", 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-silver-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1603332212000'),
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

  Widget _buildTile(String name, String image){
    return ListTile(
      leading: Container(
          height: 130,
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
                      builder: (BuildContext context) =>ComparisonPage() ));
            },
            child: Text(
              "비교하기",
              style:TextStyle(color: const Color(0xff2C2C2C), fontSize: 13),
            )
        ),
      ),
    );
  }

}