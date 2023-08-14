import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:light_test/features/home/data/events_repository.dart';
import 'package:light_test/features/home/models/event.dart';

part 'events_event.dart';

part 'events_state.dart';

@injectable
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc(this._repository) : super(const InitialEventState()) {
    on<GetEventsEvent>(onGetEvents);
  }

  final EventsRepository _repository;

  Future<void> onGetEvents(GetEventsEvent event, Emitter emit) async {
    emit(const LoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final events = _repository.getEvents();
    emit(SuccessState(events));
  }
}
