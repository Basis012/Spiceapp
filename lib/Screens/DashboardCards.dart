import 'package:flutter/material.dart';
import 'package:qbsecommerceapp/Screens/DashboardDetails.dart';
import '../DBHelper.dart';
class DashboardCards extends StatefulWidget {
  const DashboardCards({Key? key,required this.image, required this.title,required this.price,required this.color}) : super(key: key);
  final String title;
  final String image;
  final double price;
  final Color color;

  @override
  State<DashboardCards> createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  DBHelper dbHelper = DBHelper();
  int counter = 0;
  double sum = 0;
  int number = 0;
  @override
  Widget build(BuildContext context) {
    int  sumInt = sum.toInt(); // move the initialization to the build method
    String sumString = sumInt.toString();
    int mynum = widget.price.toInt();
    void _showBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          // return bottomsheet(
          //   image: image,
          //   title: title,
          //   price: price,
          //   color: color,
          // );
          return Card(
            shadowColor: Colors.grey,
            shape: CircleBorder(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(5, 10),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Image.asset(widget.image,fit: BoxFit.fill,height: 50,width: 50,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(mynum.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.only(right: 10),
                                  child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          counter++;
                                          print("haha");
                                          print(counter);
                                          if (counter >= 1) {
                                            sum = widget.price * counter;
                                          }
                                        });

                                      },
                                      child: Icon(Icons.add_circle_outline_rounded,size: 30,))),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(counter.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                              ),
                              Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.only(right: 20),
                                  child: InkWell(
                                      onTap: (){
                                        print("pop");
                                      },
                                      child: Icon(Icons.remove_circle_outline_rounded,size: 30,))),
                            ],
                          ),

                        ),

                      ],
                    ),

                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(right: 30),
                      alignment: Alignment.centerRight,
                      child: Text("Total: "+sumString,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),)),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: ElevatedButton(onPressed: ()async{
                      // dbHelper!.insert(
                      //   AddToCart_ModelClass(id: index,
                      //       productId: productId,
                      //       productName: productName,
                      //       initialPrice: initialPrice,
                      //       productPrice: productPrice,
                      //       quantity: quantity,
                      //       image: image)
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Your Cart Added Successfully"),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 185,left: 10,right: 10),
                            duration: Duration(seconds: 2),

                          )
                      );
                      print("Clicked");
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
        },
      );
    }
    return Card(
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
   color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 10),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            // width: double.infinity,
            // decoration: BoxDecoration(
            //
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 2,
            //       blurRadius: 5,
            //       offset: Offset(0, 3),
            //     )
            //   ],
            //   borderRadius: BorderRadius.all(Radius.circular(20))
            // ),
            // ),
                // Image.asset('images/packetimg.png',fit: BoxFit.cover,height: 150,)
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardDetails(
                       image: widget.image,
                       title: widget.title,
                       price: widget.price,
                       color: widget.color,
                     )));
                   },
                   child: Container(
                     width: double.infinity,
                     height: 140,
                     decoration: BoxDecoration(
                         color: widget.color,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                     ),
                     child: Image.asset(widget.image,fit: BoxFit.cover),

                   ),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: 20,top: 20),
                     child: Text(widget.title,style: TextStyle(color: Colors.grey,fontSize: 16),)),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(widget.price.toString() + '/g',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _showBottomSheet();
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.add_circle_outlined,size: 30,)
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
  }
}
