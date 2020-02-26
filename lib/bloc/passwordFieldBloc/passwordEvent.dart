import 'package:equatable/equatable.dart';

abstract class PasswordEvent extends Equatable{
  @override
  List<Object> get props => null;
}

class ValidatePasswordEvent extends PasswordEvent{
  final String inputPassword;
  ValidatePasswordEvent(this.inputPassword);
  @override
  List<Object> get props => [inputPassword];
}