import 'package:bloc/bloc.dart';
import 'package:youtube_search/ui/search/search.dart';
import 'package:youtube_search/repository/youtube_repository.dart';

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
    // TODO: implement mapEventToState
  }
}

// whenever we yield something from an async generator, adding one thing to the stream.
