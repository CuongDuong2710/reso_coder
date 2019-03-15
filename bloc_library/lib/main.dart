import 'package:bloc_library/counter_bloc.dart';
import 'package:bloc_library/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return new Main(widget: widget, counterBloc: _counterBloc);
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class Main extends StatelessWidget {
  const Main({
    Key key,
    @required this.widget,
    @required CounterBloc counterBloc,
  }) : _counterBloc = counterBloc, super(key: key);

  final MyHomePage widget;
  final CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        bloc: _counterBloc,
        builder: (BuildContext context, CounterState state) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times'),
              Text(
                '${state.counter}',
              ),
            ],
          ));
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          onPressed: () => _counterBloc.onIncrement(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(width: 10.0),
        FloatingActionButton(
          onPressed: () => _counterBloc.onDecrement(),
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        )
      ]),
    );
  }
}
