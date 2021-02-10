part of 'application_bloc.dart';

@immutable
abstract class ApplicationEvent {

}

class CurrentUserEvent extends ApplicationEvent {

}

class BottomNavEvent extends ApplicationEvent {
  final int index;
  BottomNavEvent(this.index);
  List<Object> get props => [index];
}

class SubmitFormEvent extends ApplicationEvent {
  final bool visibility;

  SubmitFormEvent(this.visibility);

  List<Object> get props => [visibility];
}
