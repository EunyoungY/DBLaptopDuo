// import 'package:flutter/material.dart';
//
// class Building {
//   String id;
//   String name;
//   String place;
//
//   Building({this.id, this.name, this.place});
// }
//
// class SearchList extends StatefulWidget {
//   SearchList({Key key}) : super(key: key);
//   @override
//   _SearchListState createState() => _SearchListState();
// }
//
// class _SearchListState extends State<SearchList> {
//   Widget appBarTitle = Text(
//     "My Properties",
//     style: TextStyle(color: Colors.white),
//   );
//   Icon actionIcon = Icon(
//     Icons.search,
//     color: Colors.orange,
//   );
//   final key = GlobalKey<ScaffoldState>();
//   final TextEditingController _searchQuery = TextEditingController();
//   List<Building> _list;
//   List<Building> _searchList = List();
//
//   bool _IsSearching;
//   String _searchText = "";
//   _SearchListState() {
//     _searchQuery.addListener(() {
//       if (_searchQuery.text.isEmpty) {
//         setState(() {
//           _IsSearching = false;
//           _searchText = "";
//           _buildSearchList();
//         });
//       } else {
//         setState(() {
//           _IsSearching = true;
//           _searchText = _searchQuery.text;
//           _buildSearchList();
//         });
//       }
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _IsSearching = false;
//     init();
//   }
//
//   void init() {
//     _list = List();
//     _list.add(
//       Building(id:"1", name: "A 1", place: "google"),
//     );
//     _list.add(
//       Building(id:"2", name: "A 2", place: "google"),
//     );
//     _list.add(
//       Building(id:"3",name: "B 3", place: "facebook"),
//     );
//     _list.add(
//       Building(id:"4",name: "B 4", place: "facebook"),
//     );
//     _list.add(
//       Building(id:"5",name: "C 5", place: "flutter"),
//     );
//     _searchList = _list;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //SizeConfig().init(context);
//     return Scaffold(
//         key: key,
//         appBar: buildBar(context),
//         body: GridView.builder(
//             itemCount: _searchList.length,
//             itemBuilder: (context, index) {
//               return Uiitem(_searchList[index]);
//             },
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//             )
//
//           /* GridView.count(
//         crossAxisCount: 3,
//         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//         childAspectRatio: 8.0 / 9.0,
//         children: _IsSearching ? _buildSearchList() : _buildList(),
//       ),*/
//           //drawer: Navigationdrawer(),
//         ));
//   }
//
//   List<Building> _buildList() {
//     return _list; //_list.map((contact) =>  Uiitem(contact)).toList();
//   }
//
//   List<Building> _buildSearchList() {
//     if (_searchText.isEmpty) {
//       return _searchList =
//           _list; //_list.map((contact) =>  Uiitem(contact)).toList();
//     } else {
//       /*for (int i = 0; i < _list.length; i++) {
//         String name = _list.elementAt(i);
//         if (name.toLowerCase().contains(_searchText.toLowerCase())) {
//           _searchList.add(name);
//         }
//       }*/
//
//       _searchList = _list
//           .where((element) =>
//       element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
//           element.place.toLowerCase().contains(_searchText.toLowerCase()))
//           .toList();
//       print('${_searchList.length}');
//       return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
//     }
//   }
//
//   Widget buildBar(BuildContext context) {
//     return AppBar(
//         centerTitle: true,
//         title: appBarTitle,
//         iconTheme: IconThemeData(color: Colors.orange),
//         backgroundColor: Colors.black,
//         actions: <Widget>[
//           IconButton(
//             icon: actionIcon,
//             onPressed: () {
//               setState(() {
//                 if (this.actionIcon.icon == Icons.search) {
//                   this.actionIcon = Icon(
//                     Icons.close,
//                     color: Colors.orange,
//                   );
//                   this.appBarTitle = TextField(
//                     controller: _searchQuery,
//                     style: TextStyle(
//                       color: Colors.orange,
//                     ),
//                     decoration: InputDecoration(
//                         hintText: "Search here..",
//                         hintStyle: TextStyle(color: Colors.white)),
//                   );
//                   _handleSearchStart();
//                 } else {
//                   _handleSearchEnd();
//                 }
//               });
//             },
//           ),
//         ]);
//   }
//
//   void _handleSearchStart() {
//     setState(() {
//       _IsSearching = true;
//     });
//   }
//
//   void _handleSearchEnd() {
//     setState(() {
//       this.actionIcon = Icon(
//         Icons.search,
//         color: Colors.orange,
//       );
//       this.appBarTitle = Text(
//         "My Properties",
//         style: TextStyle(color: Colors.white),
//       );
//       _IsSearching = false;
//       _searchQuery.clear();
//     });
//   }
// }
//
// class Uiitem extends StatelessWidget {
//   final Building building;
//   Uiitem(this.building);
//
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.fromLTRB(5, 5, 5, 7),
//       elevation: 10.0,
//       child: InkWell(
//         splashColor: Colors.orange,
//         onTap: () {
//           print(building.id);
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             AspectRatio(
//               aspectRatio: 18.0 / 11.0,
//               child: Image.asset(
//                 'assets/images/build.jpeg',
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     this.building.name,
//                     style: TextStyle(
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14.0),
//                     maxLines: 1,
//                   ),
//                   SizedBox(height: 0.0),
//                   Text(
//                     building.place,
//                     style: TextStyle(fontFamily: 'Roboto'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SubmitRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubmitRequest();
  }
}

class _SubmitRequest extends State<SubmitRequest> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.black54,
            child: ListView(
              padding: EdgeInsets.only(top: 40.0),
              children: <Widget>[
                ListTile(
                  title: Text('Dashboard'),
                ),
                ListTile(
                  title: Text('Submit Reports'),
                ),
                ListTile(
                  title: Text('Inbox Requests'),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: <Widget>[
            //    IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.help), onPressed: () {}),
          ],
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 16.0),
              child: Container(
                margin: EdgeInsets.only(left: 16.0),
                child: TextField(
                  decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            debugPrint('222');
                          }),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Search",
                      fillColor: Colors.white),
                ),
              ),
            ),
            preferredSize: Size(0.0, 80.0),
          ),
        ),
        body: Scaffold(
            body: ListView.builder(
//              separatorBuilder: (context, int) {
//                return Divider(color: Colors.black,);
//              },
              // shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  children: List.generate(6, (index) {
                    return GridTile(
                      child: new Card(
                        color: Colors.blue.shade100,
                        child: new Center(
                          child: new Text('Exterior $index'),
                        ),
                      ),
                    );
                  }),
                );
              },
              itemCount: 4,
            )
        )
    );
  }
}