import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'item_list.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Concept',
      home: Whats(),
    ));

class Whats extends StatelessWidget {
  static final bodyColor = const Color(0xFF283346);
  static final textColor = const Color(0xFF4FCE5D);
  static final List<ItemList> lista = _builList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'WhatsApp',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 18.0),
        ),
        backgroundColor: bodyColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: () {},
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroll) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: bodyColor,
              elevation: 5.0,
              forceElevated: true,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _rowImageProfile,
                  //_rowActionHead
                ],
              )),
              bottom: CupertinoTabBar(
                  backgroundColor: bodyColor,
                  border: Border(top: BorderSide.none),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.message,
                        color: textColor,
                        size: 30.0,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 30.0,
                    )),
                  ]),
            )
          ];
        },
        body: _body,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.chat,
            color: textColor,
          ),
          backgroundColor: Colors.white,
          onPressed: () {}),
    );
  }

  final _rowImageProfile = Container(
    height: 150,
    padding: const EdgeInsets.only(left: 10.0, right: 15.0),
    child: Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
            Positioned(
              right: 14.0,
              bottom: 5.0,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  Icons.add,
                  color: textColor,
                  size: 16.0,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Guillermo López',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "Hey! I'm using the new WhatsApp concept",
                style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Icon(
          Icons.edit,
          color: Colors.white,
        )
      ],
    ),
  );

  final _body = Container(
    decoration: BoxDecoration(color: bodyColor),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(side: BorderSide.none),
                color: textColor,
                textColor: Colors.white,
                child: Text("Message"),
                onPressed: () {},
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(side: BorderSide.none),
                color: Colors.white,
                child: Text("Group"),
                onPressed: () {},
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index){
              final item = lista[index];
              return _itemList(item);
            },
          ),
        )
      ],
    ),
  );

  static Widget _itemList(ItemList item){
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 10.0, right: 15.0),
      child: Row(
        children: <Widget>[
          Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/${item.img}'),
                ),
              ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${item.name}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${item.message}",
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${item.status}",
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static List<ItemList> _builList() {
    List<ItemList> list = List<ItemList>();
    list.add(ItemList(
        img: 'avatar.png',
        name: "Yael",
        message: "Hola guachoooo!!!!!",
        status: "Leyendo"));
    list.add(ItemList(
        img: 'avatar.png',
        name: "Fede",
        message: "Es muy buena",
        status: "la nada misma"));
    list.add(ItemList(
        img: 'avatar.png',
        name: "Petesburgo",
        message: "jejejeje",
        status: "Falopaaa"));
    return list;
  }
}
