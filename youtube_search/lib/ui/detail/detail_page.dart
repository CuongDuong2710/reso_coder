import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String videoId;

// 'Key' are used to get hold of a widget displayed on the screen (same as viewID in Android)
  DetailPage({Key key, @required this.videoId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
