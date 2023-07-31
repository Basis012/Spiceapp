import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbsecommerceapp/DBHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ModelClass/AddToCart_ModelClass.dart';
class cartProvider with ChangeNotifier{
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int get counter => _counter;
  double _totalprice = 0.0;
  double get totalprice => _totalprice;

  late Future<List<AddToCart_ModelClass>> _cart;
  Future<List<AddToCart_ModelClass>> getData() async{
    _cart = dbHelper.getCardList();
    return _cart;
}

  void _setPrefItems() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('cart_items', _counter);
    sharedPreferences.setDouble('total_price', _totalprice);
    notifyListeners();

  }
  void _getPrefItems() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _counter = sharedPreferences.getInt('cart_items') ?? 0;
    _totalprice = sharedPreferences.getDouble('total_price') ?? 0;
    notifyListeners();

  }



  void addTotalPrice(double productPrice){
    _totalprice = _totalprice + productPrice;
    _setPrefItems();
    notifyListeners();
  }
  void removeTotalPrice(double productPrice){
    _totalprice = _totalprice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice(){
    _getPrefItems();
    return _totalprice;
  }

  void addCounter(){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
  void removeCounter(){
    if(_counter>0){
      _counter--;
      _setPrefItems();
      notifyListeners();
    }

  }

  int getCounter(){
    _getPrefItems();
    return _counter;
  }
  // int getCounter() => _counter;
  void incrementCounter() {
      _counter++;
      notifyListeners();
  }
}