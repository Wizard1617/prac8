import 'package:avtomobile/features/home/data/data_source/home_local_data_source.dart';
import 'package:avtomobile/features/home/data/mappers/Beer_mapper.dart';
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/domain/entity/beer_entity.dart';
import 'package:avtomobile/features/home/domain/repository/home_repository.dart';
import 'package:hive/hive.dart';

class HomeRepositoryImpl implements HomeRepository{
  late Box<BeerModel> _box;
  HomeLocalDataSourceImpl() {
    _initBox();
  }

  Future<void> _initBox() async {
    _box = await Hive.openBox<BeerModel>('beer');
  }
  final  HomeLocalDataSource dataSource;
  HomeRepositoryImpl({required this.dataSource});
  @override
  Future<List<BeerEntity>> getAllDataBeer() async{
    final data = await dataSource.getAllDataBeer();
    return data.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addDataBeer(BeerModel BeerModel) async{
    await dataSource.addDataBeer(BeerModel);
  }

  @override
  Future<void> putDataBeer(int key, BeerModel BeerModel) async{
    await dataSource.putDataBeer(key, BeerModel);
  }

  @override
  Future<void> deleteBeerById(int id) async {
    await dataSource.deleteBeerById(id);
  }

  @override
  Future<BeerEntity?> getBeerById(int id) async {
    final data = await dataSource.getBeerById(id);
    return data?.toEntity();
  }

  @override
  Future<List<BeerEntity>> searchBeerByprice(String model) async {
    final data = await dataSource.searchBeerByprice(model);
    return data.map((e) => e.toEntity()).toList();
  }
}