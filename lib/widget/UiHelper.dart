import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_note_app/Widget/ColorHelper.dart';

class UiHelper {

  double radius = 5;

  CustomTextField(int maxLine,String hint,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 2,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: colorHelper.white,width: 2)
        ),
        child: TextField(
          controller: controller,
          cursorColor: colorHelper.Black,
          maxLines: maxLine,
          style: TextStyle(fontFamily: 'regular',color: colorHelper.Black),
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontFamily: 'regular'),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
              )),
        ),
      ),
    );
  }


  CustomButton(String text,VoidCallback ontap){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: colorHelper.white,width: 0.5)
        ),
        elevation: 5,
        child: InkWell(
          onTap: ontap,
          child: Container(
            width: double.infinity,
            height: 60,

            child: Center(child: Text(text,style: TextStyle(color: colorHelper.white,fontFamily: 'medium',fontSize: 18),)),
            decoration: BoxDecoration(
                color: colorHelper.blue,
                borderRadius: BorderRadius.circular(radius)
            ),
          ),
        ),
      ),
    );
  }


  CustomFloatingActionButton(VoidCallback onPressed){
    return FloatingActionButton(onPressed: onPressed,
      child: Icon(CupertinoIcons.plus,color: colorHelper.white,size: 26,),
      backgroundColor: colorHelper.blue,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: colorHelper.white),
      ),
      elevation: 5,

    );
  }

}