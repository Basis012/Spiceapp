import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<void> _createTables(Database db, int version) async {
    await db.execute('CREATE TABLE mytable (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,price INTEGER,image TEXT) VALUES("","","",)');

    // await db.execute('CREATE TABLE mytable '
    //     '('
    //     'id INTEGER PRIMARY KEY AUTOINCREMENT,'
    //     'title TEXT,'
    //     'price REAL,'
    //     image TEXT
    //     )');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await instance.database;
    return db.query('mytable');
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('mytable');

    return List.generate(maps.length, (index) {
      return CartItem(
        title: maps[index]['title'],
        price: maps[index]['price'],
        image: maps[index]['image'],
      );
    });
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'my_database.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await _createTables(db, version);
      },
    );
  }


  Future<int> insertCartItem(CartItem cartItem) async {
    final db = await instance.database;
    return await db.insert('mytable', cartItem.toMap());
  }
}

class CartItem {
  final String title;
  final double price;
  final String image;

  CartItem({
    required this.title,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'image': image,
    };
  }
}
