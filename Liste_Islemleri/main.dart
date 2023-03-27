import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomNumbersList(),
    );
  }
}

class RandomNumbersList extends StatefulWidget {
  @override
  _RandomNumbersListState createState() => _RandomNumbersListState();
}

class _RandomNumbersListState extends State<RandomNumbersList> {
  List<int> _numbers = [];
  final Random _random = Random();

  void _generateNumbers() {
    setState(() {
      _numbers.clear();
      for (int i = 0; i < 10; i++) {
        _numbers.add(_random.nextInt(100));
      }
    });
  }

  void _removeNumber(int index) {
    setState(() {
      _numbers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Numbers List'),
      ),
      body: 
           ListView.builder(
              itemCount: _numbers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_numbers[index].toString()),
                  onTap: () {
                    _removeNumber(index);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _generateNumbers,
      ),
    );
  }
}