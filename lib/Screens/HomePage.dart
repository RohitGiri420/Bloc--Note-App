import 'dart:developer';

import 'package:bloc_note_app/Bloc/NoteBloc.dart';
import 'package:bloc_note_app/Bloc/NoteState.dart';
import 'package:bloc_note_app/Screens/AddScreen.dart';
import 'package:bloc_note_app/Screens/UpdateScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/NoteEvent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<NoteBloc>().add(FetchDataEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NoteBloc,NoteState>(builder: (context, state) {
        if(state is LoadingState){
          log("Loading state is running");
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is LoadedState){
          log("Loaded state is running");
         return ListView.builder(itemBuilder: (context, index) {

            return ListTile(
              onLongPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateDataScreen(id: state.arrlist[index].id!),));
              },
              title: Text("${state.arrlist[index].title}"),
              subtitle: Text("${state.arrlist[index].desc}"),
              leading: Text("${state.arrlist[index].id}"),
              trailing: IconButton(onPressed: () {
                context.read<NoteBloc>().add(DeleteDataEvent(id: state.arrlist[index].id!));
              },
              icon: Icon(Icons.delete),),
            );

          },
         itemCount: state.arrlist.length,);
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
