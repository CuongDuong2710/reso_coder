import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_search/ui/detail/detail.dart';
import 'package:youtube_search/ui/detail/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  FlexibleSpaceBar _buildSilverAppBarContent(DetailState state) {}
}
