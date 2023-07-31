import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Check_Details_Screen extends StatefulWidget {
  const Check_Details_Screen({Key? key,required this.title,required this.quantity,required this.price,required this.totalprice,required this.image}) : super(key: key);
  final String title;
  final String quantity;
  final String price;
  final String totalprice;
  final String image;
  @override
  State<Check_Details_Screen> createState() => _Check_Details_ScreenState();
}

class _Check_Details_ScreenState extends State<Check_Details_Screen> {
  Map<String, dynamic>? paymentIntent;
  bool isLoading = false;
  bool isPaid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,color: Colors.black,size: 30,)),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.1),
                      //     spreadRadius: 2,
                      //     blurRadius: 5,
                      //     offset: Offset(5, 10),
                      //   )



                      // ],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Image.asset(widget.image,fit: BoxFit.contain,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(child: Text("Details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Name:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                    Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Quantity",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                    Text(widget.quantity,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Price:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                    Text(widget.price,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Total:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                    Text(widget.totalprice,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: MaterialButton(onPressed: () async{
                    await makePayment();
                },
                color: Colors.green,
                  height: 50,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: isLoading ? CircularProgressIndicator(
                    color: Colors.white,
                  ):
                  Text(isPaid ? "Paid" : "Pay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                child: MaterialButton(onPressed: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Dialog Title'),
                      content: Text('This is the content of the dialog.'),
                      actions: <Widget>[
                        MaterialButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    );
                  });
                },
                  child: Text("Place Order",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
                  height: 50,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      )
    );

  }
  Future<void> makePayment() async {
    try {
      setState(() {
        isLoading = true;
      });
      paymentIntent = await createPaymentIntent(widget.totalprice, 'PKR');
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "PAKISTAN", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan')).then((value){
      });


      ///now finally display payment sheeet
      setState(() {
        isLoading = false;
      });
      displayPaymentSheet();

    } catch (e, s) {
      setState(() {
        isLoading = false;
      });
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
      ).then((value){
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green,),
                      Text("Payment Successfull"),
                    ],
                  ),
                ],
              ),
            ));
        setState(() {
          isPaid = true;
        });
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));


        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled"),
          ));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      String SECRET_KEY = 'sk_test_51NDLwIH6w3nW43G0Uv6TwbTC3XC9679Y1qs2DmIqqxAI36oO1Mnc7qFxPdjwmd6iP4zVPn4PVLe7ccjqUxHbvhYy00VD8Pou5R';
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }
}
