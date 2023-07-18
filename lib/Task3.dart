import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Rank.dart';
import 'Suit.dart';


class Task3 extends StatefulWidget {
  @override
  _Task3 createState() => _Task3();
}

class _Task3 extends State<Task3> {
  final _formKey = GlobalKey<FormState>();
  int _numBoardCards = 0;
  late Suit _pocketCard1Suit, _pocketCard2Suit, _boardCard1Suit, _boardCard2Suit, _boardCard3Suit, _boardCard4Suit, _boardCard5Suit;
  late Rank _pocketCard1Rank, _pocketCard2Rank, _boardCard1Rank, _boardCard2Rank, _boardCard3Rank, _boardCard4Rank, _boardCard5Rank;
  
  var _boardCards;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monte-Carlo Simulation'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Pocket Card 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('Pocket Card 1'),
                  DropdownButtonFormField<Suit>(
                    value: _pocketCard1Suit,
                    onChanged: (Suit? newValue) {
                      setState(() {
                        _pocketCard1Suit = newValue!;
                      });
                    },
                    items: Suit.values.map((Suit suit) {
                      return DropdownMenuItem<Suit>(
                        value: suit,
                        child: Text(suit.toString().split('.')[1]),
                      );
                    }).toList(),
                  ),
                ]))]))
                
      );
    }
  }
