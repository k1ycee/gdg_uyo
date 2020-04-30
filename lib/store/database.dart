import 'dart:async';
import 'dart:io';

import 'package:gdg_uyo/models/travel_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TravelDB{
  TravelDB._();
  static final TravelDB db = TravelDB._();

  static Database _database;

  Future<Database> get database async{
    if(_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async{
    Directory trDetDirectory = await getApplicationDocumentsDirectory();
    String path = trDetDirectory.path + "TravelDB.db"; 
    return await openDatabase(path, version: 1, onOpen: (db){}, onCreate: 
    (Database db, int version)async{
      await db.execute("CREATE TABLE Travels ("
      "id INTEGER PRIMARY KEY,"
      "depature TEXT,"
      "depDate TEXT,"
      "depTime TEXT,"
      "destination TEXT,"
      "desDate TEXT,"
      "desTime TEXT,"
      "tripType TEXT"
      ")");
    });
  }

  newTravel(Travel newTr)async{
    final db = await database;
    var res = await db.insert("Travels", newTr.toJson());
    return res;
  }

  Future<List<Travel>>getTravels() async{
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM Travels");
    List<Travel> trList = res.isNotEmpty ? res.map((trs) => Travel.fromMap(trs)).toList() : [];
    return trList;
  }

  updateTravel(Travel upTravel)async{
    final db = await database;
    var res = await db.update("Travels", upTravel.toJson());
    return res;
  }

  deleteTravel(int id)async{
    final db = await database;
    var res = await db.delete("Travels", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> getCount() async{
    final db = await database;
    var res = Sqflite.firstIntValue(
      await db.rawQuery("select count (*) from Travels")
    );
    return res.toInt();
  }

}