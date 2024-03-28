import 'package:avtomobile/di/service.dart';
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/presentation/controller/home_controller.dart';
import 'package:avtomobile/features/home/presentation/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Update extends StatelessWidget {
  final int index;

  const Update({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => service<HomeController>()..id(index),
      child: _Update(index: index),
    );
  }
}

class _Update extends StatelessWidget {
  final int index;

  const _Update({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = context.watch<HomeController>().Beer; // Переменные следует называть в camelCase
    final _priceController = TextEditingController(text: beer?.price);
    final _modelController = TextEditingController(text: beer?.model);
    final _strengthController = TextEditingController(text: beer?.strength);
    final _volumeController = TextEditingController(text: beer?.volume);

    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить данные'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Логика сохранения
              context.read<HomeController>().put(index, BeerModel(
                price: _priceController.text,
                model: _modelController.text,
                strength: _strengthController.text,
                volume: _volumeController.text,
              ));
              Navigator.pop(context); // Возвращаемся назад после сохранения
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView( // Использование ListView для избежания проблем с переполнением
            children: [
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Цена',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _modelController,
                decoration: InputDecoration(
                  labelText: 'Бренд',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _strengthController,
                decoration: InputDecoration(
                  labelText: 'Крепкость',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _volumeController,
                decoration: InputDecoration(
                  labelText: 'Объём',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      Navigator.pop(context); // Возвращаемся назад без сохранения
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
