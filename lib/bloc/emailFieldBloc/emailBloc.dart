import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gdgbloc/bloc/emailFieldBloc/emailEvent.dart';
import 'package:gdgbloc/bloc/emailFieldBloc/emailState.dart';

class EmailBloc extends Bloc<EmailEvent,EmailState>{
  @override
  EmailState get initialState => InitialEmailState();

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async*{
    if(event is ValidateEmail){
      if(event.inputEmail.contains('@')){
        yield CorrectEmailState();
      }
      else 
        yield WrongEmailState("Email Should Contain @ Character");
    }
    else 
      yield null;
  }

}