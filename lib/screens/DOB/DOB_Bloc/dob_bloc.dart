import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dob_event.dart';

part 'dob_state.dart';

class DobBloc extends Bloc<DobEvent, DobState> {
  DobBloc() : super(DobInitial()) {
    on<TextFieldChangeEvent>((event, emit) {

      if (event.date == "" || event.month == '') {
        emit(DobInvalidState());
      } else {
        var d = int.tryParse(event.date);
        var m = int.tryParse(event.month);


        if (d is int && m is int && m == 02 && d > 29) {
          emit(DobErrorState("Whooooooo aree you god ?"));
        } else if (d is! int || d < 0 || d > 31) {
          print(d);
          emit(DobErrorState("Dude Enter a valid Date..."));
        } else if (m is! int || m < 0 || m > 12) {
          emit(DobErrorState("Dude Enter a valid Month..."));
        }else{
          emit(DobValidState());
        }
      }
    });
    on<SubmittedEvent>((event, emit) {
      if (event.date == "" || event.month == '') {
        emit(DobErrorState("Come On Fill It Up"));
      } else {
        var d = int.tryParse(event.date);
        var m = int.tryParse(event.month);
        if (d is int && m is int && m == 02 && d > 29) {
          emit(DobErrorState("Whooooooo aree you god ?"));
        } else if (d is! int || d < 0 || d > 31) {
          emit(DobErrorState("Dude Enter a valid Date..."));
        } else if (m is! int || m < 0 || m > 12) {
          emit(DobErrorState("Dude Enter a valid Month..."));
        }else{
          emit(DobLoadingState());
        }
      }
    });
  }
}
