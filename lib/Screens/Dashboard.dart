import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbsecommerceapp/Screens/CartItems.dart';
import 'package:qbsecommerceapp/Screens/bottomfile.dart';
import 'package:qbsecommerceapp/cart_provider.dart';
import '../DBHelper.dart';
import '../ModelClass/AddToCart_ModelClass.dart';
import '../ModelClass/DashboardModelClass.dart';
import '../ModelClass/TopTabsModelClass.dart';
import 'DashboardDetails.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int counter = 0;
  double sum = 0;
  DBHelper? dbHelper = DBHelper();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void incrementCounter(int index) {
    if (counter >= 0) {
   setState(() {
     counter++;
     sum = dashboarddata[index].price * counter;
     print(counter);
     print(sum);
   });
    }
  }
  void decrementCounter(int index) {
    if (counter > 0) {
 setState(() {
   counter--;
   sum = sum - dashboarddata[index].price;
   print(counter);
   print(sum);
 });
    }
  }
  final selectedTabColor = Colors.black;
  int current =0;
  int add_to_cart = 0;

List<DashboardModelClass> dashboarddata = [
   DashboardModelClass('images/packetimg.png', "Chillies",500.0,Color(0xFFFFEEEE)),
  DashboardModelClass('images/chana.png', "Cardamom", 500.0,Color(0xFFEBE7C1)),
  DashboardModelClass('images/packetimg.png', "Star Anise", 500.0,Color(0xFFFADEC6)),
  DashboardModelClass('images/chana.png', "Clove", 500.0,Color(0xFFE9DBD2)),
  DashboardModelClass('images/packetimg.png', "Chillies",500.0,Color(0xFFFFEEEE)),
  DashboardModelClass('images/chana.png', "Cardamom",500.0,Color(0xFFEBE7C1)),
  DashboardModelClass('images/packetimg.png', "Star Anise",500.0,Color(0xFFFADEC6)),
  DashboardModelClass('images/chana.png', "Clove",150,Color(0xFFE9DBD2)),
  DashboardModelClass('images/packetimg.png', "Chillies",500.0,Color(0xFFFFEEEE)),
  DashboardModelClass('images/chana.png', "Cardamom",500.0,Color(0xFFEBE7C1))
];
List<AddToCart_ModelClass> addtocartdata = [];

List<TopTabsModelClass> tabsdata = [
  TopTabsModelClass("All"),
  TopTabsModelClass("Dry"),
  TopTabsModelClass("Pakistani"),
  TopTabsModelClass("Custom"),
  TopTabsModelClass("All"),
  TopTabsModelClass("Dry"),
  TopTabsModelClass("Chillies"),
  TopTabsModelClass("Star"),
  TopTabsModelClass("Anise"),
  TopTabsModelClass("All"),
];
  int number = 0;
  bool _isBottomSheetVisible = false;
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<cartProvider>(context);
    int sumInt = sum.toInt(); // move the initialization to the build method
    void resetValues() {
      setState(() {
        counter = 0;
        sum = 0;
      });
    }


    void _showBottomSheet(int index) {
      int priceInt = dashboarddata[index].price.toInt();
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Consumer<cartProvider>(
            builder: (context,value,child){
            return Card(
                shadowColor: Colors.grey,
                shape: const CircleBorder(),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10,right: 80),
                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset(dashboarddata[index].image,fit: BoxFit.fill,height: 50,width: 50,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dashboarddata[index].title,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(priceInt.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      onTap: () {
                                        incrementCounter(index);
                                      },
                                      child: const Icon(Icons.add_circle_outline_rounded, size: 30),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      counter.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        decrementCounter(index);
                                      },
                                      child: const Icon(Icons.remove_circle_outline_rounded, size: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //         alignment: Alignment.centerRight,
                            //         child: InkWell(
                            //             onTap: (){
                            //               // incrementCounter(index);
                            //               if (counter >= 0) {
                            //                   counter++;
                            //                   sum = dashboarddata[index].price * counter;
                            //                   print(counter);
                            //                   print(sum);
                            //
                            //               }
                            //             },
                            //             child: const Icon(Icons.add_circle_outline_rounded,size: 30,))),
                            //     Padding(
                            //       padding: const EdgeInsets.only(right: 10),
                            //       child: Text(counter.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         alignment: Alignment.centerRight,
                            //           child: InkWell(
                            //               onTap: (){
                            //                 decrementCounter(index);
                            //               },
                            //               child: const Icon(Icons.remove_circle_outline_rounded,size: 30,))),
                            //     ),
                            //   ],
                            // ),


                          ],
                        ),

                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 80),
                          alignment: Alignment.centerRight,
                          child: Text(sum.toInt().toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),)),
                      Container(
                        margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: ElevatedButton(onPressed: ()async{
                       if(counter>0){
                         cart.addCounter();
                         dbHelper!.insert(
                           AddToCart_ModelClass(
                             productName: dashboarddata[index].title,
                             initialPrice: dashboarddata[index].price.toInt(),
                             productPrice: sum.toInt(),
                             quantity: counter,
                             image: dashboarddata[index].image,
                           ),
                         ).then((value) {
                           if (kDebugMode) {
                             cart.addTotalPrice(sum);
                             print("Product is added to your cart");
                             resetValues();
                           }
                         }).onError((error, stackTrace) {
                           if (kDebugMode) {
                             print("this is error$error");
                           }
                         });
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                             content: Text("Your Cart Added Successfully"),
                             behavior: SnackBarBehavior.floating,
                             margin: EdgeInsets.only(bottom: 195, left: 10, right: 10),
                             duration: Duration(seconds: 2),
                           ),
                         );
                         if (kDebugMode) {
                           print("Clicked");
                         }
                       }
                       else{
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                             content: Text("Add to cart value is empty"),
                             behavior: SnackBarBehavior.floating,
                             margin: EdgeInsets.only(bottom: 195, left: 10, right: 10),
                             duration: Duration(seconds: 2),
                           ),
                         );
                       }

                          // cart.incrementCounter();
                          // dbHelper!.insert(
                          //     AddToCart_ModelClass(
                          //         id: index,
                          //         productId: index.toString(),
                          //         productName: dashboarddata[index].title,
                          //         initialPrice: dashboarddata[index].price.toInt(),
                          //         productPrice: sum.toInt(),
                          //         quantity: counter,
                          //         image: dashboarddata[index].image)
                          // ).then((value) {
                          //   if (kDebugMode) {
                          //     mynum++;
                          //     cart.addTotalPrice(sum);
                          //     print("Product is added to your cart");
                          //     resetValues();
                          //   }
                          // }).onError((error, stackTrace) {
                          //   if (kDebugMode) {
                          //     print("this is error$error");
                          //   }
                          // });
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text("Your Cart Added Successfully"),
                          //       behavior: SnackBarBehavior.floating,
                          //       margin: EdgeInsets.only(bottom: 185,left: 10,right: 10),
                          //       duration: Duration(seconds: 2),
                          //
                          //     )
                          // );
                          // if (kDebugMode) {
                          //   print("Clicked");
                          // }
                        }, child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: Center(child: Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),

                        )),
                      )

                    ],
                  ),
                ),
              );
            }
          );
        },
      ).then((value) {
        setState(() {
          _isBottomSheetVisible = false;
        });
        resetValues();
      });
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6B875B),
        actions: <Widget>[

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Do something
              if (kDebugMode) {
                print(dashboarddata.length);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartItems()));
                },
                child: badges.Badge(
                  badgeContent: Consumer<cartProvider>(
                      builder: (context, value, child){
                        print("This is"+value.getCounter().toString());
                        return Text(value.getCounter().toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),);
                      },
                     ),
                  child: const Icon(Icons.card_travel),
                ),
              ),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children:  [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.teal,
                      ),
                      Divider(
                        thickness: 5.2,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const bottomfile(
                    )));
                  },
                  child: Container(

                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: const Center(child: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),))),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartItems(
                    )));
                  },
                  child: Container(

                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: const Center(child: Text("MyCart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),))),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const bottomfile(

                    )));
                  },
                  child: Container(

                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: const Center(child: Text("Contact",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),))),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartItems(
                    )));
                  },
                  child: Container(

                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: const Center(child: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),))),
                )
              ],
            ),
          ),
        ),
      ),
      body: Consumer<cartProvider>(
        builder: (context,value,child){
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      child: Image.asset('images/bg.png',fit: BoxFit.fill,),
                    ),
                    SizedBox(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 30),
                              child: const Text("Discover",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),)),
                          Row(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(left: 30),
                                  child: const Text("Your Taste !",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),)),
                              // CircleAvatar(
                              //   child: Image.asset('images/sticker.png'),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),

                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: tabsdata.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx,index){
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartItems(

                                    )));
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 45,
                                  margin: const EdgeInsets.all(5),
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: current == index ? Border.all(color: Colors.white,width: 3) : null,
                                      color: current == index ? selectedTabColor : const Color(0xFFEBEBEB),
                                      borderRadius: current == index ? BorderRadius.circular(20) : BorderRadius.circular(15)

                                  ),
                                  child: Center(child: Text(tabsdata[index].title,style: TextStyle(fontWeight: FontWeight.bold,color: current==index ? Colors.white : const Color(0xFF3D3A3A),fontSize: 13,),)),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 15,top: 15),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300, // Maximum width of each item
                              childAspectRatio: 1, // Aspect ratio of each item (width / height)
                              mainAxisSpacing: 25, // Spacing between items vertically
                              crossAxisSpacing: 15,  // Number of columns
                              mainAxisExtent: 240
                          ),
                          itemCount: dashboarddata.length, // Total number of items
                          itemBuilder: (BuildContext context, int index) {
                            return Consumer(
                              builder: (context,value,child){
                                return Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     spreadRadius: 2,
                                        //     blurRadius: 5,
                                        //     offset: const Offset(5, 10),
                                        //   )
                                        // ],
                                        borderRadius: const BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardDetails(
                                              image: dashboarddata[index].image,
                                              title: dashboarddata[index].title,
                                              price: dashboarddata[index].price,
                                              color: dashboarddata[index].color,
                                            )));
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                                color: dashboarddata[index].color,
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                            ),
                                            child: Image.asset(dashboarddata[index].image,fit: BoxFit.cover),

                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(left: 20,top: 20),
                                            child: Text(dashboarddata[index].title,style: const TextStyle(color: Colors.grey,fontSize: 16),)),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin: const EdgeInsets.only(left: 20),
                                                  child: Text('${dashboarddata[index].price}/g',style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: (){
                                                    _showBottomSheet(index);
                                                  },
                                                  child: Container(
                                                      alignment: Alignment.centerRight,
                                                      margin: const EdgeInsets.only(right: 10),
                                                      child: const Icon(Icons.add_circle_outlined,size: 30,)
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                ),

              ],
            ),
          );
        }

      ),

    );

  }
}
