import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nosql_database/homepage.dart';
import 'package:nosql_database/fruit_bloc/fruit_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping the whole app with BlocProvider to get access to FruitBloc everywhere
    // BlocProvider extends InheritedWidget.
    return BlocProvider(
      bloc: FruitBloc(),
      child: MaterialApp(
        title: 'Sembast NoSQL demo',
        theme: ThemeData(
            primarySwatch: Colors.blue, accentColor: Colors.redAccent),
        home: HomePage(),
      ),
    );
  }
}
