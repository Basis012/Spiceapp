import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:qbsecommerceapp/Screens/SplashScreen.dart';
import 'package:qbsecommerceapp/Screens/bottomfile.dart';
import 'package:qbsecommerceapp/cart_provider.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

import 'Screens/Dashboard.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51NDLwIH6w3nW43G0p5j1W71ushHCd72surx0YPk459s7trh5tisknMof6tsbJePoFSE0X0t1wKJ0TEJs37w4zxUI00jjz3TqjT';
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Dashboard(),
    // );
    return ChangeNotifierProvider(
        create: (_) => cartProvider(),
      child: Builder(builder: (BuildContext context){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      }),
    );
  }
}

