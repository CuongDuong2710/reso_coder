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
          // have only one icon, the size of whole column will be the size of icon
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
            ),
            Text(
              message,
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
