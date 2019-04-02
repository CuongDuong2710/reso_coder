import 'package:built_collection/built_collection.dart';
import 'package:youtube_search/model/search/model.dart';
import 'package:youtube_search/network/youtube_data_source.dart';

class YouTubeRepository {
  YouTubeDataSource _youTubeDataSource;

  String _lastSearchQuery;
  String _nextPageToken;

  YouTubeRepository(this._youTubeDataSource);

  Future<BuiltList<SearchItem>> searchVideos(String query) async {
    final searchResult = await _youTubeDataSource.searchVideos(query: query);

    // cache last query & next page token
    _cacheValues(nextPageToken: searchResult.nextPageToken, query: query);

    if (searchResult.items.isEmpty) throw NoSearchResultsException();

    return searchResult.items;
  }

  void _cacheValues({String query, String nextPageToken}) {
    _lastSearchQuery = query;
    _nextPageToken = nextPageToken;
  }

  Future<BuiltList<SearchItem>> fetchNextResultPage() async {
    if (_lastSearchQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextPageToken == null) {
      throw NoNextPageTokenException();
    }

    final nextPageSearchResult = await _youTubeDataSource.searchVideos(
        query: _lastSearchQuery, pageToken: _nextPageToken);

    // save cache values
    _cacheValues(
        query: _lastSearchQuery,
        nextPageToken: nextPageSearchResult.nextPageToken);

    return nextPageSearchResult.items;
  }
}

class NoSearchResultsException implements Exception {
  final message = 'No results';
}

class SearchNotInitiatedException implements Exception {
  final message = 'Cannot get the next result page without searching first';
}

class NoNextPageTokenException implements Exception {}
