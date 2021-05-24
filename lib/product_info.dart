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
    return Scaffold(
        appBar: DuoAppBar('상세스펙'),
        body: Column(
          children: [
            SizedBox(
                height: 100,
            ),
            Text("여기는 상세스펙페이지"),
            SizedBox(
                height: 100
            ),

            IconButton(
                icon: Icon(Icons.art_track_rounded),
                iconSize: 24,
                color: Colors.black54,
            onPressed: () async {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,

                  builder: (BuildContext context) {
                    return _popUpAddDrug(context);
                  },

              );},),
            Text("비교분석하기"),





          ],
        )
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