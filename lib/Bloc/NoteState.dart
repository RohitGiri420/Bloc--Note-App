import 'package:bloc_note_app/Model/NoteModel.dart';

class NoteState{}

class InitialState extends NoteState{}

class LoadingState extends NoteState{}

class LoadedState extends NoteState{
  List<NoteModel> arrlist=[];
  LoadedState({required this.arrlist});
}

class ErrorState extends NoteState{
  String ErrorMessage;
  ErrorState({required this.ErrorMessage});
}