import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:youtube_search/repository/youtube_repository.dart';
import 'package:youtube_search/ui/detail/detail_event.dart';
import 'package:youtube_search/ui/detail/detail_state.dart';
import 'package:youtube_search/model/detail/youtube_video_error.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  YouTubeRepository repository;

  DetailBloc(this.repository) : super();

  void onShowDetail({String id}) {
    dispatch(ShowDetail((b) => b..id = id));
  }

  @override
  DetailState get initialState => DetailState.initial();

  @override
  Stream<DetailState> mapEventToState(
      DetailState currentState, DetailEvent event) async* {
    if (event is ShowDetail) {
      yield DetailState.loading();

      try {
        final videoItem = await repository.fetchVideoInfo(id: event.id);
        yield DetailState.success(videoItem);
      } on YoutubeVideoError catch (e) {
        yield DetailState.failure(e.message);
      } on NoSuchVideoException catch (e) {
        yield DetailState.failure(e.message);
      }
    }
  }
}
