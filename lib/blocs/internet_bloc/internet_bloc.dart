import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;


  InternetBloc() : super(InternetInitial()) {
    on<InternetGainEvent>((event, emit) => emit(InternetGain()) );
    on<InternetLostEvent>((event, emit) => emit(InternetLost()));

   connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile||result==ConnectivityResult.wifi){
        add(InternetGainEvent());
      }else{
        add(InternetLostEvent());
      }
    });
  }
@override
  Future<void> close() {
  connectivitySubscription?.cancel();
    return super.close();


  }
}
