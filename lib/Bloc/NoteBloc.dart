import 'package:bloc_note_app/Bloc/NoteEvent.dart';
import 'package:bloc_note_app/Bloc/NoteState.dart';
import 'package:bloc_note_app/Model/NoteModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Database/DbHelper.dart';

class NoteBloc extends Bloc<NoteEvent,NoteState>{
  DbHelper dbHelper;
  NoteBloc({required this.dbHelper}):super(InitialState()){
    on<AddDataEvent>((event,emit) async{
      emit(LoadingState());
      var check = await dbHelper.AddData(event.noteModel);

      if(check){
        List<NoteModel> arrlist = await dbHelper.GetData();
        emit(LoadedState(arrlist: arrlist));
      }

      else{
        emit(ErrorState(ErrorMessage: "getting error while adding the data"));
      }
    });
  }
}