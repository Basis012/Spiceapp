import 'package:flutter/material.dart';
class AddToCart_ModelClass{
  late final int? id;
 final String? productName;
  final int? initialPrice;
  final int? productPrice;
  final int? quantity;
  final String? image;

  AddToCart_ModelClass({
   this.id,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.image
});

AddToCart_ModelClass.fromMap(Map<dynamic, dynamic> res)
  : id = res["id"],
  productName = res['productName'],
  initialPrice = res['initialPrice'],
  productPrice = res['productPrice'],
  quantity = res['quantity'],
  image = res['image'];

  Map<String, Object?> toMap(){
    return{
      'id' : id,
      'productName' : productName,
      'initialPrice' : initialPrice,
      'productPrice' : productPrice,
      'quantity' : quantity,
      'image' : image

    };
  }


}
