part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}
class InternetLost extends InternetState {}
class InternetGain extends InternetState {}
