import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:youtube_search/ui/detail/detail_event.dart';
import 'package:youtube_search/ui/detail/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  @override
  DetailState get initialState => DetailState.initial();

  @override
  Stream<DetailState> mapEventToState(
      DetailState currentState, DetailEvent event) {
    // TODO: implement mapEventToState
    return null;
  }
}
