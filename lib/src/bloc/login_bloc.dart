import 'dart:async';
import 'login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with  LoginValidator{ //vamos a implementar un mixin con validator
  //vamos a cambiar esta linia final _emailController = StreamController<String>.broadcast(); //con el "_" se identifica que una propiedad es privada
  final _email = BehaviorSubject<String>();
  final _passwordController = StreamController<String>.broadcast();
  final _password = BehaviorSubject<String>(); //es es lo mismo que un treamController<String>.broadcast(); pero de rxdart

  //sets para controllers para agregar datos al stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //geter para controllers para recuperar datos
  Stream<String> get email => _email.stream.transform(emailValidator); //conectamos los transform de las clase de validadores
  Stream<String> get password => _password.stream.transform(passwordValidator);

  //combinamos los Stream para valida rrxdart.dart
  Stream<bool>   get submitValid => Observable.combineLatest2(email, password, (e,p) => true); 

  //Este metodo esta predefinico y es para enviar los datos
  submit(){
    final myEmail = _email.value; //contiene el ultimo valor correcto
    final myPass = _password.value;
    
    print("Login con los datos usuario: $myEmail y password:$myPass");
  }

  void dispose(){ //se debe implemetar forzosamente
    _email.close();
    _password.close();
  }
}