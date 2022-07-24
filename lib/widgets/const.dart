import 'package:flutter/material.dart';


const KAppTitleText=  TextStyle(fontSize: 20,fontWeight: FontWeight.bold);

const KBoxsDecoration =BoxDecoration(
  color: Color(0xFFE0E0E0),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight:Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
  boxShadow: [
    BoxShadow(
      color:Colors.grey,
      offset: Offset(4,4),
      blurRadius: 10,
      spreadRadius: 1,
    ),
    BoxShadow(
      color:Colors.white,
      offset: Offset(-4,-4),
      blurRadius: 10,
      spreadRadius: 1,
    ),
  ],
);
