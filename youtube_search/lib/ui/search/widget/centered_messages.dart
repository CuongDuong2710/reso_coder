import 'package:flutter/material.dart';

class CenteredMessages extends StatelessWidget {
  final String message;
  final IconData icon;

  CenteredMessages({Key key, @required this.message, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.5,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
