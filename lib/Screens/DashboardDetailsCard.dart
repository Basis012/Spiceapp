import 'package:flutter/material.dart';
class DashboardDetailsCard extends StatelessWidget {
  const DashboardDetailsCard({Key? key,required this.title, required this.image,required this.price,required this.color}) : super(key: key);
  final String title;
  final String image;
  final double price;
  final Color color;
  @override
  Widget build(BuildContext context) {
     return Card(
       color: Colors.white,
       elevation: 5,
       margin: EdgeInsets.all(20),
       child: Container(
         decoration: BoxDecoration(
             color: color,
             // boxShadow: [
             //   BoxShadow(
             //     color: Colors.grey.withOpacity(0.1),
             //     spreadRadius: 2,
             //     blurRadius: 5,
             //     offset: Offset(5, 10),
             //   )
             // ],
             // borderRadius: BorderRadius.all(Radius.circular(20))
         ),
         height: 100,
         width: MediaQuery.of(context).size.width,
         child: Image.asset(image,fit: BoxFit.cover,),
       ),
     );
  }
}
