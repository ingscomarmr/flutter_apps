import 'dart:async';

class LoginValidator{

  //validando datos de email
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@') && email.contains(".") && email.length > 5){
        sink.add(email);
      }else{
        sink.addError('Sorry, this email is not valid!');
      }
    }
  );

  //validando datos de password
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 3){
        sink.add(password);
      }else{
        sink.addError('Sorry, the password is required with a length major to 3 characters');
      }
    }
  );



}