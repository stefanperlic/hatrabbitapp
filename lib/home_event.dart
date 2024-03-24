abstract class HomeEvent {}
class ButtonClickedEvent extends HomeEvent {

  final int buttonNumber;

  ButtonClickedEvent(this.buttonNumber);
}