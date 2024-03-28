
class BeerEntity {
  final int? hiveKey;
  final String priceModel;
  final String price;
  final String model;
  final String strengthvolume;
  final String strength;
  final String volume;

  BeerEntity({
    this.hiveKey,
    required this.priceModel,
    required this.strengthvolume,
    required this.price,
    required this.model,
    required this.strength,
    required this.volume
  });
}