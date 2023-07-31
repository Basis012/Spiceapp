import 'package:flutter/material.dart';
class verticaltabs extends StatelessWidget {
  const verticaltabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      SizedBox(width: 150,
         child: ListView.separated(itemBuilder: (BuildContext context, int index){
           return SizedBox(height: 5,);
         }, separatorBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){

                },
                child: Container(
                  child: Row(
                    children: [
                      AnimatedContainer(duration: Duration(milliseconds: 200),

                      color: Colors.blue,
                      ),
                      Expanded(child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          child: Text("Tab Ttile"),
                        ),
                      ))
                    ],
                  ),
                ),
              );
         },
             itemCount: 10
         ),
      ),
        Expanded(
        child: Container(
          
        ),
        )
      ],
    );
  }
}
