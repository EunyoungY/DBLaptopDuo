import 'package:flutter/material.dart';

import 'mypage.dart';

class DuoAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  final String title;

  DuoAppBar(
      this.title, {
        Key key,
      })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if(title == '상세스펙' || title == '마이페이지' || title == '비교분석' || title == '전공별랭킹') {

      return AppBar(
        elevation: 0.5,
        titleSpacing: 8,
        title: Text(
            title,
            style: TextStyle(color: Colors.black87, fontSize: 16.5)
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
            if(title=='비교분석') Navigator.pop(context);
          },
        ),
      );
    }

    else {
      return AppBar(
        elevation: 0.5,
        titleSpacing: 8,
        title: Text(
            title=="랭킹"? "전공별랭킹": title,
            style: TextStyle(color: Colors.black87, fontSize: 16.5)
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black87,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage()),
              ),
            ),
          ),
        ],
      );

    }
  }
}
