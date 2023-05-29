// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/listpage.dart';
import 'package:flutter_application_1/profilepage.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(initialIndex: 1,
        length: 3,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.list),),
                    Tab(icon: Icon(Icons.home),),
                    Tab(icon: Icon(Icons.person),),
                  ],
                  labelColor: Colors.purple.shade400,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.purple.shade400, width: 4.0),
                    insets: EdgeInsets.only(bottom: 44),
                  ),
                  unselectedLabelColor: Color(0xFF21202A),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ListPage(),
                  Homepage(),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
