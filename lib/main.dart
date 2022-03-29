import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pridicting_bug/screens/DOB/DOB_Bloc/dob_bloc.dart';
import 'Cubit/Internet/internet_cubit.dart';
import 'screens/DOB/HomeScreen.dart';

main()=>runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => DobBloc() ,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen() ,
      ),
    );
  }
}