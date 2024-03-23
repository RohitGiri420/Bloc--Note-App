import 'package:bloc_note_app/Model/NoteModel.dart';

class NoteEvent{}

class AddDataEvent extends NoteEvent{
  NoteModel noteModel;
  AddDataEvent({required this.noteModel});
}

class FetchDataEvent extends NoteEvent{}

class UpdateDataEvent extends NoteEvent{
  NoteModel noteModel;
  UpdateDataEvent({required this.noteModel});
}

class DeleteDataEvent extends NoteEvent{
  int id;
  DeleteDataEvent({required this.id});
}