import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade400,
        appBar: AppBar(
          title: const Text('Dice App', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 4.3,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 19.5,
          children: [
            Expanded(
              child: Image(image: AssetImage('assets/images/dice1.png')),
            ),
            Expanded(
              child: Image(image: AssetImage('assets/images/dice2.png')),
            ),
          ],
        ),
      ),
    );
  }
}
