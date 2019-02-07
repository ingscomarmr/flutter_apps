import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget{
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {   
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[    
          emailField(),             
          passwordField(),  
          SizedBox(height: 20.0),
          submitButtom()
        ],
      ),
    );
  }

  Widget emailField(){
    return StreamBuilder( //StreamBuilder permite manipular el patron Bloc por medio de Stream
      stream: loginBloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged: loginBloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "mi-email@email.com",
            labelText: "Email address",
            errorText: snapshot.error
          )
        );
      },
    );     
  }

  Widget passwordField(){
   return new StreamBuilder(
     stream: loginBloc.password,
     builder: (context, snapshot){
       return TextField(
          onChanged: loginBloc.changePassword,
          obscureText: true, //es para que no se vea la clave
          decoration: InputDecoration(
          hintText: "Input your password",
          labelText: "Password",
          errorText: snapshot.error
        ),
      );
     },
   );
   
   
  }

  Widget submitButtom(){
    return RaisedButton(
      child: Text("Login",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: null,
    );
  }

}