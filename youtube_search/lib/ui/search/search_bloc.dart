import 'package:bloc/bloc.dart';
import 'package:youtube_search/ui/search/search.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
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
