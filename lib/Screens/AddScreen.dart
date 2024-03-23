
import 'package:flutter/material.dart';
import 'package:bloc_note_app/widget/ColorHelper.dart';

import '../widget/UiHelper.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {

  @override

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    UiHelper uiHelper = UiHelper();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorHelper.white,
      ),
      backgroundColor: colorHelper.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              SizedBox(height: 30,),
              Text("Add Note",style: TextStyle(color: colorHelper.Black,fontFamily: "Medium",fontSize: 40,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              uiHelper.CustomTextField(1, "Title", titleController),
              uiHelper.CustomTextField(6, "Description", descController),
              uiHelper.CustomButton(
                "Save Note",
                    () {
                  String title = titleController.text;
                  String desc = descController.text;
                  if (title == "" || desc == "") {

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(

                      content: Row(
                        children: [
                          Icon(Icons.error_outline,color: Colors.white,),
                          SizedBox(width: 30,),
                          Text("Enter Required Field",style: TextStyle(fontFamily: 'regular'),),
                        ],
                      ),
                      backgroundColor: colorHelper.Black,
                      action: SnackBarAction(label: "Ok", onPressed: (){
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }),
                    ));
                  } else {

                    //code here....................

                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}