import 'package:bloc_note_app/Database/DbHelper.dart';

class NoteModel {
  int? id;
  String title;
  String desc;

  NoteModel({required this.title, required this.desc, this.id});

  factory NoteModel.FromMap(Map<String, dynamic> map) {
    return NoteModel(
        title: map[DbHelper.NoteTitle],
        desc: map[DbHelper.NoteDesc],
        id: map[DbHelper.NoteID]);
  }

  Map<String,dynamic>ToMap(){
    return{
      DbHelper.NoteID:id,
      DbHelper.NoteTitle:title,
      DbHelper.NoteDesc:desc
    };
  }
}
