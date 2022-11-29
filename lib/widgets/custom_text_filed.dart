
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget{
const CustomTextField({super.key, this.title,required this.onChanged,required this.keyboardType});
final String? title;
final TextInputType keyboardType;
 //identifiant mta3 class mte3na ili houwa il clé

final Function (String) onChanged;
@override
  Widget build(BuildContext context) {
    return
    TextField(
      keyboardType: TextInputType.text,
            onChanged: onChanged ,
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.grey
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor:Colors.white,
              label: Text(title ?? "Email"),
              labelStyle: const TextStyle(
                color: Colors.black
              ),
              hintText: title,
             
              border:const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey
              )
              ),
              
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey
                )
              ),
              

              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey
                )
              )
            ),
          );
    // ignore: todo
    // TODO: implement build
  }
}