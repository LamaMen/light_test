part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class GetEventsEvent implements EventsEvent {
  const GetEventsEvent();
}
