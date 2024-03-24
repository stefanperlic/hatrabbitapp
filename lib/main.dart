import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatrabbitapp/home_bloc.dart';
import 'package:hatrabbitapp/home_event.dart';
import 'package:hatrabbitapp/home_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (buildContext, state) {
          var outcomeText = "";
          if (state is WinState) {
            outcomeText = "You won";
          }
          return Scaffold(
            body: SafeArea(
              child: Container(
                child: Stack(
                  children: [
                    Column(
                      children: generateWidgets(buildContext, state),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(outcomeText),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> generateWidgets(BuildContext context, HomeState state) {
    var winningButtonNumber = 0;
    if (state is WinState) {
      winningButtonNumber = state.winningButtonNumber;
    }
    List<Widget> widgets = [];
    for (int buttonNumber = 1; buttonNumber <= 7; buttonNumber++) {
      var color = Colors.red;
      if (buttonNumber == winningButtonNumber) {
        color = Colors.green;
      }
      widgets.add(GestureDetector(
        onTap: () => {
          context.read<HomeBloc>().add(ButtonClickedEvent(buttonNumber))
        },
        child: Container(
          width: 100,
          height: 100,
          color: color,
          child: Text("Click me $buttonNumber"),
        ),
      ));
    }
    return widgets;
  }
}
