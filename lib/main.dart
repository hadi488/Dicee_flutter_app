import 'dart:math';

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

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String winnerText = "";
  int sum = 0;
  int lose = 0;
  int win = 0;
  void randomDiceNumber() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void checkWinner() {
    sum = leftDiceNumber + rightDiceNumber;
    if (sum > 7) {
      winnerText = "You win!";
      win += 1;
    } else {
      winnerText = "You lose!";
      lose += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instructions: Click on the dice to roll them",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Winner rules: Sum of the dices is greater than 9, you win!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      randomDiceNumber();
                      checkWinner();
                      print(leftDiceNumber);
                    },
                    child: Image.asset('assets/images/dice$leftDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      randomDiceNumber();
                      checkWinner();
                      print("right button pressed");
                    },
                    child: Image.asset(
                      'assets/images/dice$rightDiceNumber.png',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Row(
                children: [
                  SizedBox(width: 60),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "$leftDiceNumber",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "$rightDiceNumber",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "=",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "$sum",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              "${winnerText}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 40),
            Text(
              "Wins: $win",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "Loses: $lose",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
