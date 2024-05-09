import 'package:flutter/material.dart';
import 'dart:math';

class Valores extends StatefulWidget {
  @override
  _DiceValoresState createState() => _DiceValoresState();
}

class _DiceValoresState extends State<Valores> {
  var currentValor1 = 1;
  var currentValor2 = 2;
  var currentValor3 = 3;
  var intentos = 0;
  final randomizer = Random();

  void rollDice() {
    setState(() {
      intentos++;
      currentValor1 = randomizer.nextInt(6) + 1;
      currentValor2 = randomizer.nextInt(6) + 1;
      currentValor3 = randomizer.nextInt(6) + 1;

      if (currentValor1 == currentValor2 && currentValor1 == currentValor3) {
        _showWinnerDialog();
      }
    });
  }

  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¡Felicidades!'),
          content: Text('¡Ganaste en $intentos intentos!'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  intentos = 0;
                });
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/dice-$currentValor1.png',
                  width: 100,
                ),
                const SizedBox(height: 15),
              ],
            ),
            SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/dice-$currentValor2.png',
                  width: 100,
                ),
                const SizedBox(height: 15),
              ],
            ),
            SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/dice-$currentValor3.png',
                  width: 100,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'Tira',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Intentos: $intentos',
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
