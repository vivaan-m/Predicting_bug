part of 'dob_bloc.dart';

@immutable
abstract class DobState {}

class DobInitial extends DobState {}

class DobErrorState extends DobState {
  final String errorMessage;
  DobErrorState(this.errorMessage);
}

class DobValidState extends DobState {}

class DobInvalidState extends DobState {}

class DobLoadingState extends DobState {}
