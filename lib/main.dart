import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc2.dart';

void main() {
  runApp(WorkApp());
}

class WorkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc with flutter',
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, stateColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: stateColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                bloc.add(BlackColorEvent());
              }),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.pink,
              onPressed: () {
                bloc.add(PinkColorEvent());
              }),
        ],
      ),
    );
  }
}
