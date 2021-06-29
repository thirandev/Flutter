import 'dart:html';

import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {

  final String name;
  final int price;

  FoodModel({required this.name,required this.price}):super([name,price]);

  @override
  String toString() {
    return 'FoodModel { name: $name, price: $price }';
  }

}