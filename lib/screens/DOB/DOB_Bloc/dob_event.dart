part of 'dob_bloc.dart';

@immutable
abstract class DobEvent {}

class TextFieldChangeEvent extends DobEvent{
  final String date;
  final String month;
  TextFieldChangeEvent(this.date,this.month);
}

class SubmittedEvent extends DobEvent{
  final String date;
  final String month;
  SubmittedEvent(this.date,this.month);
}