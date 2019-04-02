import 'package:bloc/bloc.dart';
import 'package:youtube_search/ui/search/search.dart';
import 'package:youtube_search/repository/youtube_repository.dart';
import 'package:youtube_search/model/search/youtube_search_error.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final YouTubeRepository _youtubeRepository;

  SearchBloc(this._youtubeRepository) : super();

  void onSearchInitiated(String query) {
    dispatch(SearchInitiated((b) => b..query = query));
  }

  @override
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(
      SearchState currentState, SearchEvent event) async* {
    if (event is SearchInitiated) {
      if (event.query.isEmpty) {
        yield SearchState.initial();
      } else {
        yield SearchState.loading();

        try {
          final searchResult =
              await _youtubeRepository.searchVideos(event.query);
          yield SearchState.success(searchResult);
        } on YoutubeSearchError catch (e) {
          yield SearchState.failure(e.message);
        } on NoSearchResultException catch (e) {
          yield SearchState.failure(e.message);
        }
      }
    }
  }
}

// whenever we yield something from an async generator, adding one thing to the stream.
