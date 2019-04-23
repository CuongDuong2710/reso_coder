import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:youtube_search/network/youtube_data_source.dart';
import 'package:youtube_search/repository/youtube_repository.dart';
import 'package:youtube_search/ui/detail/detail_bloc.dart';
import 'package:youtube_search/ui/search/search_bloc.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((container) => YouTubeDataSource(container.resolve()))
    ..registerFactory((container) => YouTubeRepository(container.resolve()))
    ..registerFactory((container) => SearchBloc(container.resolve()))
    ..registerFactory((container) => DetailBloc(container.resolve()));
}
