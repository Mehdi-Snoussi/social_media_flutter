import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton ({super.key, required this.title ,required this.onPressed,this.enabled=true});
  final String title;
  final Function() onPressed;
  final bool enabled;
  @override
  Widget build (BuildContext context){
    return SizedBox(
      width: double.infinity,
      height: 50,
      child:ElevatedButton(
      onPressed: enabled ? onPressed : null,
    

   child: Text(title)));
  }
}