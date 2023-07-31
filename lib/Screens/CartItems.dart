import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbsecommerceapp/Screens/Check_Details_Screen.dart';
import 'package:badges/badges.dart' as badges;
import '../DBHelper.dart';
import '../ModelClass/AddToCart_ModelClass.dart';
import '../cart_provider.dart';
class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartItems()));
                },
                child: badges.Badge(
                  badgeContent: Consumer<cartProvider>(
                    builder: (context, value, child){
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
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(child: Text("Cart Items",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)),
              ),
              FutureBuilder(
                  future: cart.getData(),
                  builder: (context, AsyncSnapshot<List<AddToCart_ModelClass>> snapshot){
                    if(snapshot.hasData){
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                                          child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.grey,
                                                child: Image.asset(snapshot.data![index].image.toString(),fit: BoxFit.cover,height: 50,width: 50,),
                                              ),

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text(snapshot.data![index].productName.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10,top: 3),
                                                    child: Text("Quantity: ${snapshot.data![index].quantity}",style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                                  )
                                                ],
                                              ),
                                              Expanded(child:Container(
                                                  alignment: Alignment.centerRight,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Text(snapshot.data![index].initialPrice.toString(),style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Text("Total: "+snapshot.data![index].productPrice.toString(),style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                                                      ),

                                                    ],
                                                  )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10,top: 5),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              MaterialButton(onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Check_Details_Screen(
                                                  title: snapshot.data![index].productName.toString(),
                                                  quantity: snapshot.data![index].quantity.toString(),
                                                  price: snapshot.data![index].initialPrice.toString(),
                                                  totalprice: snapshot.data![index].productPrice.toString(),
                                                  image: snapshot.data![index].image.toString(),
                                                )));
                                              },
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  width: 120,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.teal,
                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                  ),
                                                  height: 40,

                                                  child: const Center(child: Text("Check Details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20),
                                                child: InkWell(
                                                    onTap: (){
                                                     dbHelper!.delete(snapshot.data![index].id!);
                                                     cart.removeCounter();
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                          const SnackBar(content: Text("Deleted Item"),
                                                            behavior: SnackBarBehavior.floating,
                                                            margin: EdgeInsets.only(left: 10,right: 10),
                                                            duration: Duration(seconds: 1),

                                                          ));
                                                    },
                                                    child: const Icon(Icons.delete,color: Colors.red,size: 30,)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
