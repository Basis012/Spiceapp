
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qbsecommerceapp/ModelClass/AddToCart_ModelClass.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'dart:io' as io;
class DBHelper{
    static Database? _db;
    Future<Database?> get db async {
      if(_db!=null){
        return _db!;
      }
      else{
        _db = await initDatabase();
        return _db;
      }

    }
    initDatabase() async {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentDirectory.path,'cart.db');
      var db = await openDatabase(path,version: 1,onCreate: _oncreate);
      return db;
    }
_oncreate(Database db, int version) async{
     await db.execute('CREATE TABLE cart (id INTEGER PRIMARY KEY, productName TEXT, initialPrice INTEGER,productPrice INTEGER, quantity INTEGER, image TEXT)');
}
Future<AddToCart_ModelClass> insert(AddToCart_ModelClass addToCart_ModelClass)async{

      var dbClient = await db;
      await dbClient!.insert('cart', addToCart_ModelClass.toMap());
      return addToCart_ModelClass;
}

    Future<List<AddToCart_ModelClass>> getCardList()async{
      var dbClient = await db;
      final List<Map<String, Object?>> queryResult = await dbClient!.query('cart');
      return queryResult.map((e) => AddToCart_ModelClass.fromMap(e)).toList();
    }
    Future<int> delete(int id) async {
      var dbClient = await db;
      return await dbClient!.delete(
        'cart',
        where: 'id = ?',
        whereArgs: [id]
      );

    }

    Future<int> updateQuantity(AddToCart_ModelClass cart) async {
      var dbClient = await db;
      return await dbClient!.update(
          'cart',
          cart.toMap(),
          where: 'id = ?',
          whereArgs: [cart.id]
      );

    }

}