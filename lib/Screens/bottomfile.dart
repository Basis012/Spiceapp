import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qbsecommerceapp/Screens/CartItems.dart';
import 'package:qbsecommerceapp/Screens/Dashboard.dart';

import '../ModelClass/AddToCart_ModelClass.dart';
import 'ApisFile.dart';
class bottomfile extends StatefulWidget {
  const bottomfile({Key? key}) : super(key: key);

  @override
  State<bottomfile> createState() => _bottomfileState();
}
var tstyle = TextStyle(color: Colors.white,
    fontSize: 50
);
class _bottomfileState extends State<bottomfile> {
  var padding = EdgeInsets.symmetric(horizontal: 18,vertical: 5);
  double gap =10;

  List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<Widget> text = [
    Dashboard(

    ),
    CartItems(

    ),
    Dashboard()
  ];
  PageController controller = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // PageView.builder(
      //     itemCount: 4,
      //     controller: controller,
      //     onPageChanged: (page){
      //       setState(() {
      //         _selectedIndex= page;
      //       });
      //     },
      //     itemBuilder:(context,position){
      //       return Container(
      //         color: colors[position],
      //         child:Center(child: text[position]),
      //       );
      //     }),
      text[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.white,
                  offset: Offset(0,25),
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
            child: GNav(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
              tabs: [
                GButton(
                  gap: gap,
                  icon: Icons.home,
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  text: 'Home',
                  textColor: Colors.white,
                  backgroundColor: Colors.teal.withOpacity(0.3),
                  iconSize: 25,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.add_shopping_cart,
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  text: 'MyCart',
                  textColor: Colors.white,
                  backgroundColor: Colors.teal.withOpacity(0.3),
                  iconSize: 25,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.person,
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  text: 'Profile',
                  textColor: Colors.white,
                  backgroundColor: Colors.teal.withOpacity(0.3),
                  iconSize: 25,
                  padding: padding,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState(() {
                  _selectedIndex =index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
