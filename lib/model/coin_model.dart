import 'package:flutter/material.dart';
class Coin{
  String name;
  String symbol;
  String image;
  num price;
  num change;
  num changePercentage;
  Coin({
    required this.name,
    required this.symbol,
    required this.image,
    required this.price,
    required this.change,
    required this.changePercentage,
  });
  factory Coin.fromJson(Map<String,dynamic>Json){
    return Coin(
        name:Json['name'],
        symbol: Json['symbol'],
        image: Json['image'],
        price: Json['current_price'],
        change: Json['price_change_24h'],
        changePercentage: Json['price_change_percentage_24h']
    );
  }
}
List<Coin>coinList=[];

