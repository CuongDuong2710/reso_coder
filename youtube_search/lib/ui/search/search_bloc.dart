import 'package:bloc/bloc.dart';
import 'package:youtube_search/ui/search/search.dart';
import 'package:youtube_search/repository/youtube_repository.dart';
import 'package:youtube_search/model/search/youtube_search_error.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final YouTubeRepository _youtubeRepository;

  SearchBloc(this._youtubeRepository) : super();

  // dispatch search
  void onSearchInitiated(String query) {
    dispatch(SearchInitiated((b) => b..query = query));
  }

  // dispatch fetch next page
  void fetchNextResultPage() {
    dispatch(FetchNextResultPage());
  }

  @override
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(
      SearchState currentState, SearchEvent event) async* {
    if (event is SearchInitiated) {
      yield* mapSearchInitiated(event);
    } else if (event is FetchNextResultPage) {
      yield* mapFetchNextResultPage();
    }
  }

  Stream<SearchState> mapSearchInitiated(SearchInitiated event) async* {
    if (event.query.isEmpty) {
      yield SearchState.initial();
    } else {
      yield SearchState.loading();

      try {
        final searchResult = await _youtubeRepository.searchVideos(event.query);
        yield SearchState.success(searchResult);
      } on YoutubeSearchError catch (e) {
        yield SearchState.failure(e.message);
      } on NoSearchResultsException catch (e) {
        yield SearchState.failure(e.message);
      }
    }
  }

  Stream<SearchState> mapFetchNextResultPage() async* {
    try {
      final nextPageResults = await _youtubeRepository.fetchNextResultPage();
      yield SearchState.success(currentState.searchResults + nextPageResults);
    } on NoNextPageTokenException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    } on SearchNotInitiatedException catch (e) {
      yield SearchState.failure(e.message);
    } on YoutubeSearchError catch (e) {
      yield SearchState.failure(e.message);
    }
  }
}

// whenever we yield something from an async generator, adding one thing to the stream.
