import 'package:equatable/equatable.dart';

abstract class EmailState extends Equatable{
  @override
  List<Object> get props => null;
}

class InitialEmailState extends EmailState{}

class WrongEmailState extends EmailState{
  final String errorMessage;
  WrongEmailState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class CorrectEmailState extends EmailState{}