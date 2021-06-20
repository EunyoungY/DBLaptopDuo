import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'duo_appbar.dart';
import 'major_ranking_list.dart';
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
    db.getConnection().then((conn) {
      String sql = ('select major_name from dbfinal.major_spec');
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            myList.add(row[0]);
          });

        }
      });
      conn.close();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ListView.builder(
            itemCount: 11,
          itemBuilder: (BuildContext context, int index) {
              // var major = myList[i];
              return ListTile(
                title: Container(width: 100,child: Text(myList.isEmpty? ' ': myList[index], overflow: TextOverflow.ellipsis,)),
                onTap: () {
                  // i=0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MajorRankingPage(myList[index])),
                  );

                },
              );
            // return PersonTile(people[index-1]);
          },
        )
      ),
    );
  }
}