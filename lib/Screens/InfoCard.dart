import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InfoCard extends StatelessWidget {
  const InfoCard({Key? key,required this.name,required this.profession}) : super(key: key);
final String name,profession;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(profession),
    );
  }
}
