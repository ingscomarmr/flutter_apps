import 'dart:async';
import 'login_validator.dart';
class LoginBloc with  LoginValidator{ //vamos a implementar un mixin con validator
  final _emailController = StreamController<String>.broadcast(); //con el "_" se identifica que una propiedad es privada
  final _passwordController = StreamController<String>.broadcast();

  //sets para controllers para agregar datos al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //geter para controllers para recuperar datos
  Stream<String> get email => _emailController.stream.transform(emailValidator); //conectamos los transform de las clase de validadores
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  void dispose(){ //se debe implemetar forzosamente
    _emailController.close();
    _passwordController.close();
  }
}