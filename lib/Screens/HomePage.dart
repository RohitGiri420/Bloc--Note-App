import 'package:bloc_note_app/Bloc/NoteBloc.dart';
import 'package:bloc_note_app/Bloc/NoteEvent.dart';
import 'package:bloc_note_app/Bloc/NoteState.dart';
import 'package:bloc_note_app/Screens/AddScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NoteBloc,NoteState>(builder: (context, state) {
        if(state is LoadingState){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is LoadedState){
          ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text("${state.arrlist[index].title}"),
              subtitle: Text("${state.arrlist[index].desc}"),
              leading: Text("${state.arrlist[index].id}"),
            );
          },);
        }

        else if(state is ErrorState){
          return Center(
            child: Text(state.ErrorMessage),
          );
        }

        return Container();

      },),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataScreen(),));
      },
      child: Icon(Icons.add),),
    );
  }
}
