import 'dart:io';
import 'package:bloc_note_app/Model/NoteModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  Database? _database;

  static String TableName = "NoteTable";
  static String NoteID = "NoteId";
  static String NoteTitle = "NoteTitle";
  static String NoteDesc = "NoteDescription";

  Future<Database> getDb() async{
    if(_database!=null){
      return _database!;
    }
    else{
      return initDb();
    }
  }

  Future<Database> initDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path,"NoteDb");
    _database= await openDatabase(path,version: 1,onCreate: (db, version) {
          db.execute("Create Table $TableName($NoteID integer primary key autoincrement,$NoteTitle text,$NoteDesc text)");
    },);

    return _database!;
  }

  Future<bool> AddData(NoteModel noteModel) async {
    var db = await getDb();
    var check = await db.insert(TableName, noteModel.ToMap());
    return check>0;
  }

  Future<List<NoteModel>> GetData() async{
    List<NoteModel> arrList=[];
    var db = await getDb();
    var list = await db.query(TableName);

    for(Map<String,dynamic> eachdata in list){
      NoteModel noteModel = NoteModel.FromMap(eachdata);
      arrList.add(noteModel);
    }
    return arrList;

  }

  Future<bool> UpdatNote(NoteModel noteModel) async{
    var db = await getDb();
    var check = await db.update(TableName, noteModel.ToMap(),where: "$NoteID = ${noteModel.id}");
    return check>0;
  }
  
  Future DeleteNote(int id) async{
    var db = await getDb();
    db.delete(TableName,where: "$NoteID=?",whereArgs: [id.toString()]);
  }
  }