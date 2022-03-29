import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pridicting_bug/screens/DOB/DOB_Bloc/dob_bloc.dart';
import 'package:pridicting_bug/utils/Utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController date = TextEditingController();
  TextEditingController month = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(12),
      height: screenHeight(context),
      width: screenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: date,
                    onChanged: (v) {
                      BlocProvider.of<DobBloc>(context).add(
                          TextFieldChangeEvent(
                              date.value.text, month.value.text));
                    },
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                        hintText: "Birth Date"),
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: month,
                    onChanged: (v) {
                      BlocProvider.of<DobBloc>(context).add(
                          TextFieldChangeEvent(
                              date.value.text, month.value.text));
                    },
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                        hintText: "Birth Month"),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 12),
            child: BlocBuilder<DobBloc, DobState>(
              builder: (context, state) {
                if (state is DobErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          BlocBuilder<DobBloc, DobState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  if(state is DobValidState){
                  BlocProvider.of<DobBloc>(context).add(SubmittedEvent(date.text, month.text));
                  }
                },
                child: CircleAvatar(
                  backgroundColor: (state is DobValidState)
                      ? Theme.of(context).primaryColor
                      : (state is DobLoadingState)?Colors.transparent:Colors.grey,
                  child: (state is DobLoadingState)?const CircularProgressIndicator():const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                ),
              );
            },
          )
        ],
      ),
    )));
  }
}
