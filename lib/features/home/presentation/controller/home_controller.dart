
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/domain/entity/beer_entity.dart';
import 'package:avtomobile/features/home/domain/use_case/home_use_case.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final HomeUseCase useCase;

  HomeController(this.useCase);

  List<BeerEntity> BeerList = [];

  BeerEntity? Beer;

  void init() async {
    BeerList = await useCase.call();
    notifyListeners();
  }

  void add(BeerModel BeerModel) async {
    await useCase.callAdd(BeerModel);
    notifyListeners();
  }

  void put(int key, BeerModel BeerModel) async {
    await useCase.callPut(key, BeerModel);
    notifyListeners();
  }

  void deleteById(int? hiveKey) async {
    if (hiveKey != null) {
      await useCase.callDeleteById(hiveKey);
      init(); // Перезагрузка данных после удаления.
    } else {
      // Обработка случая, когда hiveKey == null
      print("Ошибка: hiveKey не может быть null при удалении.");
    }
  }

  void id(int hiveKey) async {
    Beer = await useCase.callByID(hiveKey); // Используйте hiveKey для получения данных
    notifyListeners();
  }

  void search(String model) async {
    BeerList = await useCase.callByprice(model);
    notifyListeners();
  }
}