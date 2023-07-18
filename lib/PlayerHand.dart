import 'dart:math';

import 'PlayerCard.dart';
import 'Rank.dart';
import 'Suit.dart';

class PlayerHand{

  late List<PlayerCard?> hand;

  PlayerHand(this.hand){
    hand = hand;
    hand = sortHand(hand);
  }

  PlayerHand.randomHand(){
    hand = randomize([]);
    while(!isValidHand(hand)){
      hand = randomize([]);
    }
  }

  List<PlayerCard?> randomize(List<PlayerCard?> hand){
    final seed = DateTime.now().millisecondsSinceEpoch + this.hashCode;
    final random = Random(seed);
    for (int i = 0; i < 5; i++) {
      final suit = Suit.values[random.nextInt(Suit.values.length)];
      final rank = Rank.values[random.nextInt(Rank.values.length)];
      hand.add(PlayerCard.suitrank(suit,rank));
    }
    return hand;
  }

  List<PlayerCard?> getCards(){
    return hand;
  }

  String getHandValue(){
    if (hasRoyalFlush(hand)) {
      return "ROYALFLUSH";
    }
    if (hasStraightFlush(hand)) {
      return "STRAIGHTFLUSH";
    }
    if (hasFourOfAKind(hand)) {
      return "FOUROFAKIND";
    }
    if (hasFullHouse(hand)) {
      return "FULLHOUSE";
    }
    if (hasFlush(hand)) {
      return "FLUSH";
    }
    if (hasStraight(hand)) {
      return "STRAIGHT";
    }
    if (hasThreeOfAKind(hand)) {
      return "THREEOFAKIND";
    }
    if(hasTwoPair(hand)) {
      return "TWOPAIRS";
    }
    if (hasPair(hand)) {
      return "ONEPAIR";
    }
    if (isValidHand(hand))
      return "HIGHCARD";
    else{
      return "NOTVALID";
    }
  }

  int getHandValueIndex(){
    if (hasRoyalFlush(hand)) {
      return 1;
    }
    if (hasStraightFlush(hand)) {
      return 2;
    }
    if (hasFourOfAKind(hand)) {
      return 3;
    }
    if (hasFullHouse(hand)) {
      return 4;
    }
    if (hasFlush(hand)) {
      return 5;
    }
    if (hasStraight(hand)) {
      return 6;
    }
    if (hasThreeOfAKind(hand)) {
      return 7;
    }
    if(hasTwoPair(hand)) {
      return 8;
    }
    if (hasPair(hand)) {
      return 9;
    }
    if (isValidHand(hand))
      return 10;
    else{
      return 999999;
    }
  }

  List<PlayerCard?> sortHand(List<PlayerCard?> hand){
    hand.sort((a, b) {
    if (a!.rank != b!.rank) {
      return a.rank.index.compareTo(b.rank.index);
    }
    return a.suit.index.compareTo(b.suit.index);
    });
    return hand;

  }

  bool hasPair(List<PlayerCard?> hand) {
    var ranks = hand.map((card) => card?.rank).toSet();
    return ranks.length == 4;  // 4 unique ranks means there is a pair
  }

  bool hasThreeOfAKind(List<PlayerCard?> hand) {
    var rankCounts = <Rank, int>{};
    for (var card in hand) {
      rankCounts[card!.rank] = (rankCounts[card.rank] ?? 0) + 1;
    }
    return rankCounts.values.where((count) => count == 3).length == 1;
  }

  bool hasTwoPair(List<PlayerCard?> hand) {
    var rankCounts = <Rank, int>{};
    for (var card in hand) {
      rankCounts[card!.rank] = (rankCounts[card.rank] ?? 0) + 1;
    }
    return rankCounts.values.where((count) => count == 2).length == 2;
  }

  bool hasFourOfAKind(List<PlayerCard?> hand) {
    var rankCounts = <Rank, int>{};
    for (var card in hand) {
      rankCounts[card!.rank] = (rankCounts[card.rank] ?? 0) + 1;
    }
    return rankCounts.values.where((count) => count == 4).length == 1;
  }

  bool hasFlush(List<PlayerCard?> hand) {
    var suitCounts = <Suit, int>{};
    for (var card in hand) {
      suitCounts[card!.suit] = (suitCounts[card.suit] ?? 0) + 1;
    }
    return suitCounts.values.any((count) => count == 5);
  }

  bool hasStraight(List<PlayerCard?> hand) {
    var sortedHand = hand.toList()..sort((a, b) => a!.rank.index - b!.rank.index);
    for (int i = 0; i < sortedHand.length - 1; i++) {
      if (sortedHand[i]!.rank.index + 1 != sortedHand[i + 1]!.rank.index) {
        return false;
      }
    }
    return true;
  }

  bool hasFullHouse(List<PlayerCard?> hand) {
    var rankCounts = <Rank, int>{};
    for (var card in hand) {
      rankCounts[card!.rank] = (rankCounts[card.rank] ?? 0) + 1;
    }
    return rankCounts.values.contains(3) && rankCounts.values.contains(2);
  }

  bool hasRoyalFlush(List<PlayerCard?> hand) {
    return hasFlush(hand) && hasStraight(hand) && hand.any((card) => card!.rank == Rank.ACE);
  }
  bool hasStraightFlush(List<PlayerCard?> hand) {
    return hasFlush(hand) && hasStraight(hand);
  }

  Rank hasHighCard(List<PlayerCard?> hand) {
    return hand.last!.rank;
  }

  bool isValidHand(List<PlayerCard?> hand) {
      final cards = Set<PlayerCard?>();
      for (final card in hand) {
        if (!cards.add(card)) {
          return false;
        }
      }
      return true;
    }



}