import 'package:flutter/material.dart';
class tasb extends StatelessWidget {
  const tasb({Key? key, required this.title}) : super(key: key);
 final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,index){
              return Container(
                height: 45,
                margin: EdgeInsets.all(5),
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(20)

                ),
                child: Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Color(
                    0xFF3D3A3A),fontSize: 17,),)),
              );
            }),
          )
        ],
      ),
    );
  }
}
