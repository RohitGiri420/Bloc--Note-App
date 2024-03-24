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

    on<FetchDataEvent>((event,emit)async{
      emit(LoadingState());
      List<NoteModel> arrlist = await dbHelper.GetData();
      emit(LoadedState(arrlist: arrlist));
    });

    on<UpdateDataEvent>((event,emit)async{
      emit(LoadingState());
      bool check =await  dbHelper.UpdatNote(event.noteModel);
      if(check){
        List<NoteModel>arrlist = await dbHelper.GetData();
        emit(LoadedState(arrlist: arrlist));
      }
      else{
        emit(ErrorState(ErrorMessage:"Getting error while updating the data"));
      }
    });

    on<DeleteDataEvent>((event,emit) async {
      emit(LoadingState());
      dbHelper.DeleteNote(event.id);
      List<NoteModel>arrlist = await dbHelper.GetData();
      emit(LoadedState(arrlist: arrlist));
    });
  }

}