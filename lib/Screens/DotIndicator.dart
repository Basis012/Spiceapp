import 'package:flutter/material.dart';
class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key,this.isActive = false}) : super(key: key);
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
