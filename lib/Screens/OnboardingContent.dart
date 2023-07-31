
import 'package:flutter/material.dart';
class OnboardingContent extends StatelessWidget {
  const OnboardingContent({Key? key,required this.image,required this.title,required this.description}) : super(key: key);
  final String image,title,description;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('images/background.png',fit: BoxFit.cover,),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 100),
              //   height: MediaQuery.of(context).size.height,
              //   alignment: Alignment.centerLeft,
              //   width: 300,
              //   child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              // ),
              // Container(
              //   width: 300,
              //   child: Text(description,style: TextStyle(fontSize: 20)),
              // )
            ],
          ),


        ],
      ),
    );
  }
}
