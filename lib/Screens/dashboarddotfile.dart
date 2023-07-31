import 'package:flutter/material.dart';
class dashboarddotfile extends StatelessWidget {
  const dashboarddotfile({Key? key,required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.teal : Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
