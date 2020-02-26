import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgbloc/bloc/passwordFieldBloc/passwordEvent.dart';
import 'package:gdgbloc/bloc/passwordFieldBloc/passwordState.dart';

class PasswordBloc extends Bloc<PasswordEvent,PasswordState>{
  @override
  PasswordState get initialState => InitialPasswordState();

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async*{
    if(event is ValidatePasswordEvent){
      if(event.inputPassword.length<5){
        yield WrongPasswordState("Password must contain atleast 5 characters");
      }
      else 
        yield CorrectPasswordState();
    }
  }
}