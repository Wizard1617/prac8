
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/domain/entity/beer_entity.dart';

abstract interface class HomeRepository{

  Future<List<BeerEntity>> getAllDataBeer();

  Future<void> addDataBeer(BeerModel BeerModel);

  Future<void> putDataBeer(int key, BeerModel BeerModel);

  Future<void> deleteBeerById(int id);

  Future<BeerEntity?> getBeerById(int id);

  Future<List<BeerEntity>> searchBeerByprice(String model);
}