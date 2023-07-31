import 'package:flutter/material.dart';
import 'package:qbsecommerceapp/Screens/DashboardDetailsCard.dart';

import 'DotIndicator.dart';
import 'dashboarddotfile.dart';
class DashboardDetails extends StatefulWidget {
  const DashboardDetails({Key? key,required this.title, required this.image,required this.price,required this.color}) : super(key: key);
  final String title;
  final String image;
  final double price;
  final Color color;
  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  late PageController pageController;
  int pageindex = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,size: 30,)),
                ),
                Container(
                  height: 300,
                  child: PageView.builder(
                      itemCount: 3,
                      controller: pageController,
                      onPageChanged: (index){
                        setState(() {
                          pageindex = index;
                        });
                      },
                      itemBuilder: (context,index) => DashboardDetailsCard(
                        image: widget.image,
                        title: widget.title,
                        price: widget.price,
                        color: widget.color,
                      )
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(3,(index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: dashboarddotfile(isActive: index==pageindex,),
                        )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.title,style: TextStyle(color: Colors.black,fontSize: 25,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("PKR",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(widget.price.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                  child: Text("Old Mix helps you to find authentic herbsand spices bursting flavours whilebrimming your confidence",style: TextStyle(fontSize: 14,letterSpacing: 1.5),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
