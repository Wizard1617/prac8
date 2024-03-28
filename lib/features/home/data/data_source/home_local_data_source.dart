import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:hive/hive.dart';

abstract interface class HomeLocalDataSource {
  Future<List<BeerModel>> getAllDataBeer();

  Future<void> addDataBeer(BeerModel BeerModel);

  Future<void> putDataBeer(int key, BeerModel BeerModel);

  Future<void> deleteBeerById(int id);

  Future<BeerModel?> getBeerById(int id);

  Future<List<BeerModel>> searchBeerByprice(String price);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  late Box<BeerModel> _box;

  @override
  Future<List<BeerModel>> getAllDataBeer() async {
    _box = await Hive.openBox<BeerModel>('beer');
    return _box.values.toList();
  }

  @override
  Future<void> addDataBeer(BeerModel BeerModel) async {
    _box.add(BeerModel);
  }

  @override
  Future<void> putDataBeer(int key, BeerModel BeerModel) async {
    _box.put(key, BeerModel);
  }

  @override
  Future<void> deleteBeerById(int id) async {
    await _box.delete(id);
  }

  @override
  Future<BeerModel?> getBeerById(int id) async {
    return _box.get(id);
  }

  Future<List<BeerModel>> searchBeerByprice(String model) async {
    _box = await Hive.openBox<BeerModel>('beer');
    return _box.values.where((element) => element.model.contains(model)).toList();
  }
}
