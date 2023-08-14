part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class InitialEventState implements EventsState {
  const InitialEventState();
}

class LoadingState implements EventsState {
  const LoadingState();
}

class SuccessState implements EventsState {
  const SuccessState(this.events);

  final List<Event> events;
}
