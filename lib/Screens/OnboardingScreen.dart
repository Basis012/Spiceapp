import 'package:flutter/material.dart';
import 'package:qbsecommerceapp/Screens/bottomfile.dart';
// import 'package:spiceapp/Screens/Dashboard.dart';
// import 'package:spiceapp/Screens/DotIndicator.dart';
// import 'package:spiceapp/Screens/OnboardingContent.dart';
import '../ModelClass/OnboardModelClass.dart';
import 'Dashboard.dart';
import 'DotIndicator.dart';
import 'OnboardingContent.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnboardModelClass> listdata = [
    OnboardModelClass(
        'https://images.unsplash.com/photo-1606914469633-bd39206ea739?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3BpY2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        "Fancy Another Blast Of Feel-Good Flavors?",
        "Old Mix helps you to find authentic herbs and spices bursting flavors while brimming your confidence."
    ),
    OnboardModelClass(
        'https://plus.unsplash.com/premium_photo-1666174326693-8e0eb439d839?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHNwaWNlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        "Fancy Another Blast Of Feel-Good Flavors?",
        "Old Mix helps you to find authentic herbs and spices bursting flavors while brimming your confidence."
    ),
    OnboardModelClass(
        'https://images.unsplash.com/photo-1599536884823-1bc4fb5f9dea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNwaWNlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        "Fancy Another Blast Of Feel-Good Flavors?",
        "Old Mix helps you to find authentic herbs and spices bursting flavors while brimming your confidence."
    ),
  ];
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
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: listdata.length,
                controller: pageController,
                onPageChanged: (index){
                  setState(() {
                    pageindex = index;
                  });
                },
                itemBuilder: (context,index) => OnboardingContent(
                  image: listdata[index].image,
                  title: listdata[index].title,
                  description: listdata[index].description,
                )),
          ),
          Container(
            color: Color(0xFFF6F6F6),
            margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(listdata.length,(index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: DotIndicator(isActive: index==pageindex,),
                )),
                Spacer(),
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if(pageindex == listdata.length-1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>bottomfile(
                        )));
                      }
                      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder()
                    ),
                    child: Icon(Icons.keyboard_double_arrow_right,size: 30,)

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
