import 'Rank.dart';
import 'Suit.dart';

class PlayerCard {
  late String card;
  late Suit suit;
  late Rank rank;

  PlayerCard(this.card){
    switch(card[0]){
      case 'H':
        suit = Suit.HEART;
        break;
      case 'C':
        suit = Suit.CLUB;
        break;
      case 'D':
        suit = Suit.DIAMOND;
        break;
      case 'S':
        suit = Suit.SPADE;
    }

    switch(card[1]){
      case 'A':
        rank = Rank.ACE;
        break;
      case '2':
        rank = Rank.TWO;
        break;
      case '3':
        rank = Rank.THREE;
        break;
      case '4':
        rank = Rank.FOUR;
        break;
      case '5':
        rank = Rank.FIVE;
        break;
      case '6':
        rank = Rank.SIX;
        break;
      case '7':
        rank = Rank.SEVEN;
        break;
      case '8':
        rank = Rank.EIGHT;
        break;
      case '9':
        rank = Rank.NINE;
        break;
      case 'T':
        rank = Rank.TEN;
        break;
      case 'J':
        rank = Rank.JACK;
        break;
      case 'Q':
        rank = Rank.QUEEN;
        break;
      case 'K':
        rank = Rank.KING;
        break;
    }
  }

  PlayerCard.suitrank(this.suit, this.rank){
    suit = suit;
    rank = rank;

  }

  String getRank(){
    return rank.toString().split('.').last;
  }
  String getSuit(){
    return suit.toString().split('.').last;
  }
}