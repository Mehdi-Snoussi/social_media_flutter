
import 'package:first_app/views/bottom_app.dart';
import 'package:first_app/views/home_screen.dart';
import 'package:first_app/widgets/custom_button.dart';
import 'package:first_app/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginScreen({super.key}); 
  @override
  State<StatefulWidget> createState() { //pour recuperer et declare les varible mta3na 
    return _LoginScreenState();
  }
}
class _LoginScreenState extends State<LoginScreen>{ //slach to9sed baha priveé
String _email = "";
String _password="";


  @override
  void initState(){
    _email="";
    _password="";
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false, //
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: 
        Container(
          decoration: const BoxDecoration(
            image:DecorationImage(image:  NetworkImage("https://images.pexels.com/photos/1157804/pexels-photo-1157804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            fit: BoxFit.cover,
            )
          ),
         
          padding:const EdgeInsets.only(
            top:100,
            left: 40,
            right: 40,
            bottom: 20
          ),
         
          child: Column(children:  [
               Text("LOG IN Screen ",
            style: Theme.of(context).textTheme.titleLarge
            ),
          const SizedBox(height: 20),
      
          const Text ("Welcome to your First Flutter Application",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            color:Colors.red,
            fontSize:30,
            fontWeight: FontWeight.w600
          ),
          ),
           Padding(
            padding: const EdgeInsets.only(bottom :30, top: 20),
            child: 
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              title: "Email" ,
            onChanged: (value){
              setState(() {
                _email=value;
              });
            })
          ),
           CustomTextField(
            keyboardType: TextInputType.number,
            title: "Passworld",
           onChanged: ((value){
            setState(() {
              _password=value;
            });
           }),),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            enabled: (_email.isNotEmpty && _password.isNotEmpty)? true : false,
          title: "connexion",
          onPressed:() {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context )=> const BottomScreen())
           );
          },
          
          
          )
         
          ]),
          
             
          
        )
        )));

  }
}