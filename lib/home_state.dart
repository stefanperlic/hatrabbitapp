abstract class HomeState {}
class InitialState extends HomeState {}
class WinState extends HomeState {
  final int winningButtonNumber;

  WinState(this.winningButtonNumber);
}
class PlayingState extends HomeState {}