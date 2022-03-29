import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';


enum InternetState { Initial,Lost,Gained}


class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile||result==ConnectivityResult.wifi){
       emit(InternetState.Gained);
      }else{
       emit(InternetState.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
