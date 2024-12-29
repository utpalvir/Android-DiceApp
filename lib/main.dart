import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBar(
                title: Text('Dicee'),
                backgroundColor: Colors.white70,
                centerTitle: true,
                elevation: 0,
              ),
              Container(
                color: Colors.greenAccent,
                height: 2,
                width: double.infinity,
              ),
            ],
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text('Left: $leftDiceNumber, Right: $rightDiceNumber'),
        ),
        duration: Duration(milliseconds: 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              changeDiceFace();
              message:
              'Left button got pressed';
              style:
              TextStyle(
                color: Colors.white,
              );
            },
            child: Image.asset('images/dice$leftDiceNumber.png'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              changeDiceFace();
              message:
              'Right button got pressed';
              style:
              TextStyle(
                color: Colors.white,
              );
            },
            child: Image.asset('images/dice$rightDiceNumber.png'),
          ),
        ),
      ],
    ));
  }
}
