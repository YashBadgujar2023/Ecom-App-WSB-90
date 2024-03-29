import 'package:flutter/material.dart';

class Uihelper{
  static CustomAlertBox({required String name, String? content,required BuildContext context}){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(name),
            content: Text(content!),
            actions: [
              TextButton(
                  onPressed: ()
                  {Navigator.pop(context);},
                  child: Text("ok")
              )
            ],
          );
        }
    );
  }
}