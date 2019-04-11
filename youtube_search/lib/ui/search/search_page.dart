import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_search/model/search/search_snippet.dart';
import 'package:youtube_search/ui/search/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_search/ui/search/search_state.dart';
import 'package:youtube_search/ui/search/widget/centered_messages.dart';
import 'package:youtube_search/ui/search/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _searchBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: BlocBuilder(
          bloc: _searchBloc,
          builder: (context, SearchState state) {
            if (state.isInitial) {
              return CenteredMessages(
                message: 'Start searching!',
                icon: Icons.ondemand_video,
              );
            }
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.isSuccessful) {
              return _buildResultList(state);
            } else {
              return CenteredMessages(
                  message: state.error, icon: Icons.error_outline);
            }
          }),
    );
  }

  Widget _buildResultList(SearchState state) {
    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification, // as function reference
        child: ListView.builder(
          itemCount: _calculateListItemCount(state), // call function
          controller: _scrollController,
          itemBuilder: (context, index) {
            return index >= state.searchResults.length
                ? _buildLoaderListItem()
                : _buildVideoListItemCard(state.searchResults[index].snippet);
          },
        ));
  }

  int _calculateListItemCount(SearchState state) {
    if (state.hasReachedEndOfResults)
      return state.searchResults.length;
    else
      //add one CircularProgressIndicator at bottom
      return state.searchResults.length + 1;
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      // if that space below the last item
      // inside of this view is zero -> in fact at the bottom of list view
      _searchBloc.fetchNextResultPage();
    }
    return false;
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildVideoListItemCard(SearchSnippet snippet) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              snippet.thumbnails.high.url,
              fit: BoxFit.cover,
            ),
          )
        ]),
      ),
    );
  }
}
