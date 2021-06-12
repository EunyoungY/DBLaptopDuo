import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'duo_appbar.dart';
import 'mysql.dart';

class MajorRanking extends StatefulWidget {
  @override
  _MajorRankingState createState() => _MajorRankingState();
}

class _MajorRankingState extends State<MajorRanking> {
  var db =  Mysql();
  var myList = [];

  @override
  Widget build(BuildContext context) {
    int i=0;
    db.getConnection().then((conn) {
      String sql = ('select major from dbfinal.user');
      conn.query(sql).then((results) {
        for(var row in results){
            myList.add(row[0]);
        }
      });
      conn.close();
    });


    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ListView.builder(
            itemCount:10,
          itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Container(width: 100,child: Text(myList[i++], overflow: TextOverflow.ellipsis,)),
              );
            // return PersonTile(people[index-1]);
          },
        )
      ),
    );
  }
}
