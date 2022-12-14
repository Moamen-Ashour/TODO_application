

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context,String message){

  showDialog(
    barrierDismissible: true,
      context: context,
      builder: (context)=> AlertDialog(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 5,),
              Text(message)
            ],
          ),
        ),
      )
  );

}


hideLoding(BuildContext context){
  Navigator.pop(context);
}


void ShowMessage(BuildContext context, String message,String BTNpos, VoidCallback Actionpos,{String? BTNneg,VoidCallback? Actionneg}){
  showDialog(context: context,
      builder: (context){
    List<Widget>Action=[
      TextButton(onPressed: Actionpos, child: Text(BTNpos))
    ];
    if(BTNneg != null){
      Action.add(TextButton(onPressed: Actionneg, child: Text(BTNpos)));
    }
  return AlertDialog(
    title: Text(message),
    actions: Action
  );
});
}