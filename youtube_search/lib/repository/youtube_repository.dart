import 'package:built_collection/built_collection.dart';
import 'package:youtube_search/model/search/model.dart';
import 'package:youtube_search/network/youtube_data_source.dart';

class YouTubeRepository {
  YouTubeDataSource _youTubeDataSource;

  YouTubeRepository(this._youTubeDataSource);

  Future<BuiltList<SearchItem>> searchVideos(String query) async {
    final searchResult = await _youTubeDataSource.searchVideos(query: query);
    if (searchResult.items.isEmpty) throw NoSearchResultException();
    return searchResult.items;
  }
}

class NoSearchResultException implements Exception {
  final message = 'No results';
}
