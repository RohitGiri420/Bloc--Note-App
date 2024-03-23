class NoteState{}

class LoadingState extends NoteState{}

class LoadedState extends NoteState{
  int arrlist;
  LoadedState({required this.arrlist});
}

class ErrorState extends NoteState{
  String ErrorMessage;
  ErrorState({required this.ErrorMessage});
}