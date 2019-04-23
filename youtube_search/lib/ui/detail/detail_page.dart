import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_search/ui/detail/detail.dart';
import 'package:youtube_search/ui/detail/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_search/ui/search/widget/centered_messages.dart';

class DetailPage extends StatefulWidget {
  final String videoId;

// 'Key' are used to get hold of a widget displayed on the screen (same as viewID in Android)
  DetailPage({Key key, @required this.videoId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _detailBloc = kiwi.Container().resolve<DetailBloc>();

  @override
  void initState() {
    super.initState();
    _detailBloc.onShowDetail(id: widget.videoId);
  }

  @override
  void dispose() {
    super.dispose();
    _detailBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _detailBloc,
      child: Scaffold(
        body: BlocBuilder(
          bloc: _detailBloc,
          builder: _buildScaffoldContent,
        ),
      ),
    );
  }

  Widget _buildScaffoldContent(BuildContext context, DetailState state) {
    // CustomScrollView can hold multiple Silvers which have custom scrolling effects
    // A Silver is simply a portion of a scrollable area.
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 178,
          pinned: true,
          flexibleSpace: _buildSilverAppBarContent(state),
          // app bar stills be seen (red background) when we scroll down
        )
      ],
    );
  }

  FlexibleSpaceBar _buildSilverAppBarContent(DetailState state) {
    if (state.isLoading) {
      return FlexibleSpaceBar();
    }

    if (state.isSuccessful) {
      return FlexibleSpaceBar(
        title: Text(
          state.videoItem.snippet.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Stack orders children behind each other
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(state.videoItem.snippet.thumbnails.high.url,
                fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                    0.15,
                    0.15
                  ],
                      colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent
                  ])),
            ),
          ],
        ),
      );
    } else {
      return FlexibleSpaceBar(
        background: CenteredMessages(
          message: state.error,
          icon: Icons.error_outline,
        ),
      );
    }
  }
}
