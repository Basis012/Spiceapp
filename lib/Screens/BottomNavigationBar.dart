import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'CartItems.dart';
class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}
var tstyle = TextStyle(color: Colors.white.withOpacity(0.6),
    fontSize: 50
);
class _BottomNavigationBarState extends State<BottomNavigationBar> {
  var padding = EdgeInsets.symmetric(horizontal: 18,vertical: 5);
  double gap =10;

  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.teal

  ];

  List<Text> text = [
    Text('Home', style:tstyle ),
    Text('Like',style: tstyle,),
    Text('Search',style: tstyle,),
    Text('User',style: tstyle,),
  ];
  PageController controller = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
body:
PageView.builder(
    itemCount: 4,
    controller: controller,
    onPageChanged: (page){
      setState(() {
        _selectedIndex= page;
      });
    },
    itemBuilder:(context,position){
      return Container(
        color: colors[position],
        child:Center(child: text[position]),
      );
    }),
      bottomNavigationBar:
      SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0,25),
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
            child: GNav(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 900),
              tabs: [
                GButton(
                  gap: gap,
                  icon: Icons.ac_unit,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.purple,
                  text: 'Home',
                  textColor: Colors.purple,
                  backgroundColor: Colors.purple.withOpacity(0.2),
                  iconSize: 24,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.access_alarm,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.pink,
                  text: 'Like',
                  textColor: Colors.pink,
                  backgroundColor: Colors.pink.withOpacity(0.2),
                  iconSize: 24,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.search,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.grey,
                  text: 'Search',
                  textColor: Colors.grey,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  iconSize: 24,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.supervised_user_circle,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.teal,
                  text: 'Home',
                  textColor: Colors.teal,
                  backgroundColor: Colors.teal.withOpacity(0.2),
                  iconSize: 24,
                  padding: padding,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState(() {
                  _selectedIndex =index;
                });
                controller.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
