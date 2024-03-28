import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BeerModel extends HiveObject {
  @HiveField(0)
  final String price;

  @HiveField(1)
  final String model;

  @HiveField(2)
  final String strength;

  @HiveField(3)
  final String volume;

  BeerModel({
    required this.price,
    required this.model,
    required this.strength,
    required this.volume,
  });

  factory BeerModel.fromJson(Map<String, dynamic> json){
    return BeerModel(
    price: json['price'],
    model: json['model'],
    strength: json['strength'],
    volume: json['volume']);
  }
}