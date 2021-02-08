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
