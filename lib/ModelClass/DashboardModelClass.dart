

import 'package:flutter/material.dart';
class DashboardModelClass{
  String image;
  String title;
  double price;
  Color color;
  int mycounter;

  DashboardModelClass(this.image, this.title, this.price,this.color,{this.mycounter=0});
}