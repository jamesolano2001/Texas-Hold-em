import 'package:a9/PlayerHand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HandVal.dart';
import 'PlayerCard.dart';

class Task2 extends StatefulWidget {
  @override
  _Task2 createState() => _Task2();
}


class _Task2 extends State<Task2> {
  PlayerHand hand1 = PlayerHand.randomHand();
  PlayerHand hand2 = PlayerHand.randomHand();
  String winner = "Winning Hand!";
  String loser = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hand Matchup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child:Column(
                  children: [
                    Text(hand1.getCards()[0]!.getSuit()+"-"+hand1.getCards()[0]!.getRank()),
                    Text(hand1.getCards()[1]!.getSuit()+"-"+hand1.getCards()[1]!.getRank()),
                    Text(hand1.getCards()[2]!.getSuit()+"-"+hand1.getCards()[2]!.getRank()),
                    Text(hand1.getCards()[3]!.getSuit()+"-"+hand1.getCards()[3]!.getRank()),
                    Text(hand1.getCards()[4]!.getSuit()+"-"+hand1.getCards()[4]!.getRank()),
                    Text(hand1.getHandValue()),
                    Visibility(
                      visible: (hand1.getHandValueIndex()<hand2.getHandValueIndex()),
                      child: Container(child: Text("Winning Hand!"))
                  )
                ],

                ),),
                Expanded(child:Column(
                  children: [
                        Text(hand2.getCards()[0]!.getSuit()+"-"+hand2.getCards()[0]!.getRank()),
                        Text(hand2.getCards()[1]!.getSuit()+"-"+hand2.getCards()[1]!.getRank()),
                        Text(hand2.getCards()[2]!.getSuit()+"-"+hand2.getCards()[2]!.getRank()),
                        Text(hand2.getCards()[3]!.getSuit()+"-"+hand2.getCards()[3]!.getRank()),
                        Text(hand2.getCards()[4]!.getSuit()+"-"+hand2.getCards()[4]!.getRank()),
                        Text(hand2.getHandValue()),
                        Visibility(
                      visible: (hand2.getHandValueIndex()<hand1.getHandValueIndex()),
                      child: Container(child: Text("Winning Hand!"))
                  )
                  ],
                )),
              ],
            ),
            SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              ElevatedButton(
                child: Text('Draw hands randomly'),
                onPressed: () {
                  setState(() {
                    hand1 = PlayerHand.randomHand();
                    hand2 = PlayerHand.randomHand();
                  }); 
                },
              ),

              ElevatedButton(
                            child: Text('Go back'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
            ],))
          ],
        )
      ),
    );
  }
}

