import 'package:flutter/material.dart';
import 'package:laptop_duo/customizing_search.dart';

import 'cart.dart';
import 'duo_appbar.dart';
import 'major_ranking.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    MajorRanking(),
    // Container(),
    CustomizingSearch(),
    Cart(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0?  DuoAppBar('랭킹') :
      _selectedIndex == 1? DuoAppBar('맞춤형검색') : DuoAppBar('찜한상품'),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.account_balance_outlined),
                iconSize: 24,
                color: _selectedIndex == 0
                    ? Colors.black87
                    : Colors.black26,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                }),
            SizedBox(width: 70, height: 36),
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                iconSize: 24,
                color: _selectedIndex == 2
                    ? Colors.black87
                    : Colors.black26,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 30),
        child: FloatingActionButton(
          // elevation: 0,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle, // circular shape
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurpleAccent[200],
                  // Colors.blueAccent[100],
                  const Color(0xff421F90)
                ],
              ),
            ),
            child: Icon(Icons.person_search),
          ),

          onPressed: () async {
            setState(() {
              _selectedIndex = 1;
            });
            // showModalBottomSheet(
            //     backgroundColor: Colors.transparent,
            //     context: context,
            //     builder: (BuildContext context) {
            //       return _popUpAddDrug(context);
            //     });
          },
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

    );
  }
}
