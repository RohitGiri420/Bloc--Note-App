import 'package:bloc_note_app/Bloc/NoteBloc.dart';
import 'package:bloc_note_app/Database/DbHelper.dart';
import 'package:bloc_note_app/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(dbHelper: DbHelper()),
      child: MaterialApp(

        home: HomePage(),

      ),
    );
  }
}

