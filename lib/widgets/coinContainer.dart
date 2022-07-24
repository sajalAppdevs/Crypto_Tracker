
import 'package:flutter/material.dart';
import 'const.dart';

class coinCard extends StatelessWidget {

  String name;
  String symbol;
  String image;
  double price;
  double change;
  double changePercentage;
  coinCard({
    required this.name,
    required this.symbol,
    required this.image,
    required this.price,
    required this.change,
    required this.changePercentage,
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
      child: Container(
        height: 100,
        decoration: KBoxsDecoration,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  height: 68,
                  width: 68,
                  child: Image.network(image)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(name,style: KAppTitleText,)),
                  Text(symbol,style: const TextStyle(fontSize: 18,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.end,
                children: [
                  Text("\$${price.toDouble()}",style: KAppTitleText,),
                  Text(
                    change.toDouble()<0
                        ?change.toDouble().toStringAsFixed(4)
                        :'+${change.toDouble().toStringAsFixed(4)}',
                    style: TextStyle(
                        color: change.toDouble()<0?Colors.red:Colors.green,fontSize: 18,fontWeight:FontWeight.bold),),
                  Text(
                    changePercentage.toDouble()<0
                        ?"${changePercentage.toDouble().toStringAsFixed(3)}%"
                        :'+'+changePercentage.toDouble().toStringAsFixed(3)+"%"
                    ,style:
                  TextStyle(color: changePercentage.toDouble()<0?Colors.red:Colors.green,fontSize: 18,fontWeight:FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
