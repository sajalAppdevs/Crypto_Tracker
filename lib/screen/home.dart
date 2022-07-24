import 'dart:async';
import 'dart:convert';
import 'package:bitcoin_ticker/widgets/coinContainer.dart';
import 'package:flutter/material.dart';
import '../model/coin_model.dart';
import '../widgets/const.dart';
import 'package:http/http.dart'as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("CRYPTO PRICE TRACKER",style: KAppTitleText),
          centerTitle: true,
        ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context,index){
            return coinCard(
                name: coinList[index].name,
                symbol: coinList[index].symbol,
                image: coinList[index].image,
                price: coinList[index].price.toDouble(),
                change: coinList[index].change.toDouble(),
                changePercentage: coinList[index].changePercentage.toDouble());
          },
      ));
  }

        /// Code of Calling APi
  Future<List<Coin>>fetchCoin()async{
    coinList=[];
    final response=await http.get(Uri.parse('https://api.coingecko.com/api/v3/c'
        'oins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if(response.statusCode==200){
      List<dynamic>values=[];
      values=jsonDecode(response.body);
      if(values.length>0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic>map=values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState((){
          coinList;
        });
      }
      return coinList;
    }
    else{
      throw Exception('Falid to load coins');
    }
  }
  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 10), (timer) =>fetchCoin());
    super.initState();
  }
}
