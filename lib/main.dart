import 'dart:convert';
import 'dart:ui';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:toomato_ui/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

final Color backgroundColor = Colors.redAccent;

class MenuDashboard extends StatefulWidget {
  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  int _currentIndex = 0;
  int _counter = 0;
  String nme = "";

  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = Duration(milliseconds: 400);
  final List<String> data = ["Some 1", "Some 2", "Some 3"];
  final planetCard = Container(
    height: 200.0,
    width: 680,
    margin: new EdgeInsets.only(left: 2.0, top: 40),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(40.0),
    ),
  );


  final planetThumbnail = Container(
    margin: EdgeInsets.symmetric(
      vertical: 16.0,
    ),
    alignment: FractionalOffset.centerLeft,
    child: Image(
      image: new AssetImage("assets/Group53.png"),
      height: 190.0,
      width: 190.0,
    ),

  );


  final Map<String,Color> itemColors = {
    "Some 1" : Color(0xffEEEACF),
    "Some 2": Color(0xffab1e1e),
    "Some 3" : Colors.redAccent,
  };
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          dashboard(context),
        ],
      ),
    );
  }




  Widget dashboard(context) {
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0.15 * screenHeight,
      bottom: isCollapsed ? 0 : 0.15 * screenHeight,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      duration: duration,
      child: Material(
        animationDuration: duration,
        borderRadius: BorderRadius.all(Radius.circular(28)),
        elevation: 10,
        color: Color(0xFFF2F2F2),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 16, top: 48),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children:  [
                  InkWell(child: Icon(Icons.menu, color: Colors.black), onTap: () {
                  },),
                  Icon(Icons.shopping_cart, color: Colors.grey),
                ],),
              Container(
                padding: EdgeInsets.only(top: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Want to eat\nHealthy food?", style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 20, top: 30),
                child: Align(
                  child: TextButton(
                    //Add button style
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      primary: Color(0xFFEFEEEE),
                      surfaceTintColor: Color(0xFFEFEEEE),
                      minimumSize: Size((MediaQuery.of(context).size.height)/2.4, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.0),
                          side: BorderSide(color: Color(0xFFEFEEEE))
                      ),
                    ),
                    onPressed: () {
                    },
                    child: Align(
                        alignment: Alignment(-0.7, 0.1),
                        child: Text('Search',
                        )),
                    //set text color here,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              itemW(color: itemColors[data[index]]!, text: data[index]), //try to change text colour from here but it change whole box color. :(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 22,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Flexible(child: Container(

                  child: Padding(
                    padding: const EdgeInsets.only(top: 1,bottom: 20),
                    child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                width: 60,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(child: planetCard),
                                    Positioned(
                                      top: -6,
                                      left: MediaQuery.of(context).size.width * 0.049,
                                      child: planetThumbnail,
                                    ),
                                    Positioned(top:180,child: Text(
                                      "Red Sauce\n   Pasta",
                                    ),
                                      bottom: 0,
                                      left: MediaQuery.of(context).size.width * 0.17,
                                    ),
                                    //planetThumbnail,
                                  ],
                                ),
                              ),
                              onTap: () {
                              }
                          ),
                          InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                width: 60,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(child: planetCard),
                                    Positioned(
                                      top: -20,
                                      left: MediaQuery.of(context).size.width * 0.049,
                                      child: planetThumbnail,
                                    ),
                                    Positioned(top:180,child: Text(
                                      "Red Sauce\n   Pasta",
                                    ),
                                      bottom: -09,
                                      left: MediaQuery.of(context).size.width * 0.17,
                                    ),
                                    //planetThumbnail,
                                  ],
                                ),
                              ),
                              onTap: () {

                              }
                          ),
                          InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                width: 60,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(child: planetCard),
                                    Positioned(
                                      top: -20,
                                      left: MediaQuery.of(context).size.width * 0.049,
                                      child: planetThumbnail,
                                    ),
                                    Positioned(top:180,child: Text(
                                      "Red Sauce\n   Pasta",
                                    ),
                                      bottom: -09,
                                      left: MediaQuery.of(context).size.width * 0.17,
                                    ),
                                    //planetThumbnail,
                                  ],
                                ),
                              ),
                              onTap: () {
                              }
                          ),
                          InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                width: 60,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(child: planetCard),
                                    Positioned(
                                      top: -20,
                                      left: MediaQuery.of(context).size.width * 0.049,
                                      child: planetThumbnail,
                                    ),
                                    Positioned(top:180,child: Text(
                                      "Red Sauce\n   Pasta",
                                    ),
                                      bottom: -09,
                                      left: MediaQuery.of(context).size.width * 0.17,
                                    ),
                                    //planetThumbnail,
                                  ],
                                ),
                              ),
                              onTap: () {
                              }
                          ),
                        ]
                    ),
                  )
              ),),
            ],
          ),
        ),
      ),
    );
  }

}

Widget itemW({
  required String text,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.only(left: 40, right: 40,top: 10, bottom: 20),
    alignment: Alignment.center,
    decoration: ShapeDecoration(
      shape: const StadiumBorder(),
      color: color,
    ),
    child: Text(text),
  );
}