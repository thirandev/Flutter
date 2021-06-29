import 'dart:core';
import 'package:flutter/material.dart';

class StoreData{
  //  Acts as a db to store the food name and price
  StoreData._privateConstructor();
  static final StoreData _instance = StoreData._privateConstructor();

  factory StoreData()
  {
    return _instance;
  }

  Map<String,int> _foodNamePrice = Map<String,int>();

  void storeFoodDetails(String foodName, int foodPrice){
    _foodNamePrice[foodName] = foodPrice;
  }

  void removeFoodDetails(String foodName){
    _foodNamePrice.remove(foodName);
  }

  Map<String,int> retrieveFoodDetails(){
    return _foodNamePrice;
  }

}