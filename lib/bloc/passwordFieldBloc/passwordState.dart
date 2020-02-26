import 'package:equatable/equatable.dart';

abstract class PasswordState extends Equatable{
  @override
  List<Object> get props => [];
}

class InitialPasswordState extends PasswordState{} 

class WrongPasswordState extends PasswordState{
  final String errorMessage;
  WrongPasswordState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CorrectPasswordState extends PasswordState{}