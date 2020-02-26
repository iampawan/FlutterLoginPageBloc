import 'package:equatable/equatable.dart';

abstract class EmailEvent extends Equatable{

}

class ValidateEmail extends EmailEvent{
  final String inputEmail;
  ValidateEmail(this.inputEmail);
  
  @override
  List<Object> get props => [inputEmail];
}