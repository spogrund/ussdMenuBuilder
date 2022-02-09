// ignore_for_file: prefer_const_declarations



import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ussdbuilder/menu_node.dart';
import 'package:path_provider/path_provider.dart';

class MenuDatabase {
  static final MenuDatabase instance = MenuDatabase._init();

  static Database? _database;
  
  MenuDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB('menu_db.db');
    return _database!;


  }
  Future<Database> _initDB(String pathName) async{
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, pathName);
    print(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    //final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableNodes (
      ${MenuNodeFields.menuID} $idType,
      ${MenuNodeFields.parentID} $idType,
      ${MenuNodeFields.USSDText} $textType


  )  
''');

  }

  Future close() async{
    final db = await instance.database;
    db.close();

  }

Future<MenuNode> create(MenuNode node) async{
  final db = await instance.database;
  final id = await db.insert(tableNodes, node.toJson());
  return node.copy(menuID: id);


}
Future<MenuNode> readNode(int id) async{
  final db = await instance.database;

  final maps = await db.query(
    tableNodes,
    columns: MenuNodeFields.values,
    where:  '${MenuNodeFields.menuID} = ?',
    whereArgs: [id],
  );
  if (maps.isNotEmpty){
    return MenuNode.fromJson(maps.first);

  } else{
    throw Exception('ID $id not found');
  }


}
Future <List<MenuNode>> readAllNodes() async{
  final db = await instance.database;

  final result = await db.query(tableNodes, orderBy: '{$MenuNodeFields.menuID} ASC' );

  return result.map((json) => MenuNode.fromJson(json)).toList();


}
Future <int> update(MenuNode node) async{
  final db = await instance.database;

  return db.update(
    tableNodes,
    node.toJson(),
    where: '${MenuNodeFields.menuID} = ?',
    whereArgs: [node.menuID], 
    );

}
Future <int> delete(int id) async{
  final db = await instance.database;

  return await db.delete(
    tableNodes,
    where: '${MenuNodeFields.menuID} = ?',
    whereArgs: [id],  
  
  );

}



}