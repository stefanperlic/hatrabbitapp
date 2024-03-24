import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatrabbitapp/home_event.dart';
import 'package:hatrabbitapp/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final randomNumber = generateRandomNumber(1, 7);
  final clickedButtons = [];

  HomeBloc() : super(InitialState()) {
    on<ButtonClickedEvent>(_handleButtonClicked);
  }

  FutureOr<void> _handleButtonClicked(ButtonClickedEvent event,
      Emitter<HomeState> emitter) {

    if (!clickedButtons.contains(event.buttonNumber)) {
      print("random number is $randomNumber");
      final buttonNumber = event.buttonNumber;
      print("button clicked $buttonNumber");
      if (buttonNumber == randomNumber) {
        emitter(WinState(buttonNumber));
      } else {
        emitter(PlayingState());
      }

      clickedButtons.add(event.buttonNumber);
    } else {
      print("this button is already clicked ${event.buttonNumber}");
    }
  }

  static int generateRandomNumber(int min, int max) {
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }
}