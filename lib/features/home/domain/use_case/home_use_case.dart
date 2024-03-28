
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/domain/entity/beer_entity.dart';
import 'package:avtomobile/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  Future<List<BeerEntity>> call() async {
    return _repository.getAllDataBeer();
  }

  Future<void> callAdd(BeerModel BeerModel) async {
    _repository.addDataBeer(BeerModel);
  }

  Future<void> callPut(int key, BeerModel BeerModel) async {
    _repository.putDataBeer(key, BeerModel);
  }

  Future<void> callDeleteById(int id) async {
    await _repository.deleteBeerById(id);
  }

  Future<BeerEntity?> callByID(int id) async {
    return _repository.getBeerById(id);
  }

  Future<List<BeerEntity>> callByprice(String model) async {
    return _repository.searchBeerByprice(model);
  }
}