
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/domain/entity/beer_entity.dart';

extension BeerMapper on BeerModel {
  BeerEntity toEntity() {
    return BeerEntity(
      hiveKey: this.key,
      priceModel: '$price $model',
      strengthvolume: '$strength $volume',
      price: price,
      model: model,
      strength: strength,
      volume: volume,
    );
  }
}