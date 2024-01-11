// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
Widget homeViewBody()=>Column(
  mainAxisAlignment:MainAxisAlignment.center,
  children:
  [
    Center(child:Text('There is No Weather 😔',style:TextStyle(fontSize:24,fontWeight:FontWeight.w600,color:Colors.red),),),
    SizedBox(height:10.0,),
    Center(child:Text('Start Searching Now 🔍',style:TextStyle(fontSize:24,fontWeight:FontWeight.w600,color:Colors.blue),),),
  ],
);