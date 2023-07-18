import 'Task2.dart';
import 'package:flutter/material.dart';
import 'PlayerCard.dart';
import 'PlayerHand.dart';
import 'Task3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Task 1'),
      routes: {
        '/second': (context) => Task2(),
        '/third' : (context) => Task3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PlayerCard? hand1, hand2, hand3, hand4, hand5;
  PlayerHand? currentHand;
  bool handInPlay = false;
  String invalidCheck = "";
  RegExp letter = RegExp(r'[A-Z]');
  RegExp number = RegExp(r'[1-9A-Z]');
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Texas-Hold'em"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Hand Type Evaluator"),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  if(value != ""){
                      if(letter.matchAsPrefix(String.fromCharCode(value.codeUnitAt(0))) != null && number.matchAsPrefix(String.fromCharCode(value.codeUnitAt(1))) != null){
                      hand1 = new PlayerCard(value);
                    }
                    else{
                      hand1 = null;
                    }
                  }
                  else{
                    hand1 = null;
                  }
              
                });
              },
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  if(value != ""){
                      if(letter.matchAsPrefix(String.fromCharCode(value.codeUnitAt(0))) != null && number.matchAsPrefix(String.fromCharCode(value.codeUnitAt(1))) != null){
                      hand2 = new PlayerCard(value);
                    }
                    else{
                      hand2 = null;
                    }
                  }
                  else{
                    hand2 = null;
                  }
                });
              },
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  if(value != ""){
                      if(letter.matchAsPrefix(String.fromCharCode(value.codeUnitAt(0))) != null && number.matchAsPrefix(String.fromCharCode(value.codeUnitAt(1))) != null){
                      hand3 = new PlayerCard(value);
                    }
                    else{
                      hand3 = null;
                    }
                  }
                  else{
                    hand3 = null;
                  }
                });
              },
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  if(value != ""){
                      if(letter.matchAsPrefix(String.fromCharCode(value.codeUnitAt(0))) != null && number.matchAsPrefix(String.fromCharCode(value.codeUnitAt(1))) != null){
                      hand4 = new PlayerCard(value);
                    }
                    else{
                      hand4 = null;
                    }
                  }
                  else{
                    hand4 = null;
                  }
                });
              },
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  if(value != ""){
                      if(letter.matchAsPrefix(String.fromCharCode(value.codeUnitAt(0))) != null && number.matchAsPrefix(String.fromCharCode(value.codeUnitAt(1))) != null){
                      hand5 = new PlayerCard(value);
                    }
                    else{
                      hand5 = null;
                    }
                  }
                  else{
                    hand5 = null;
                  }
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  if(handInPlay){
                    return Text(currentHand?.getHandValue() ?? ' ');
                  }
                  else{
                    return Text(invalidCheck);
                  }
                    
                  
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
              onPressed: () {
                if(hand1 != null && hand2 != null && hand3 != null && hand4 != null && hand5 != null){
                  currentHand = PlayerHand([hand1,hand2,hand3,hand4,hand5]);
                  if(currentHand!.isValidHand([hand1,hand2,hand3,hand4,hand5])){
                    handInPlay = true;
                  }
                  else{
                    handInPlay = false;
                    invalidCheck = "NOTVALID";
                  }
                }
                else{
                  handInPlay = false;
                  invalidCheck = "NOTVALID";
                }
                setState(() {
                });
              },
              child: Text('Assess Hand'),
            ),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('Task 2'),)
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/third');
                },
                child: Text('Task 3'),)
            ),
          ],
        ),
      ),
    );
  }

 
}
