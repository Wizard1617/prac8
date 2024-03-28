import 'package:avtomobile/di/service.dart';
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:avtomobile/features/home/presentation/controller/home_controller.dart';
import 'package:avtomobile/features/home/presentation/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => service<HomeController>()..init(),
      child: _Add()
    );
  }
}

class _Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _priceController = TextEditingController();
    final _modelController = TextEditingController();
    final _strengthController = TextEditingController();
    final _volumeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить новое пиво'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
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
              // Удаление кнопок в пользу FloatingActionButton
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Проверка на пустые поля
          if (_priceController.text.trim().isEmpty ||
              _modelController.text.trim().isEmpty ||
              _strengthController.text.trim().isEmpty ||
              _volumeController.text.trim().isEmpty) {
            // Показываем SnackBar с предупреждением
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Введите все данные'),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            // Если все поля заполнены, добавляем данные и возвращаемся назад
            context.read<HomeController>().add(BeerModel(
              price: _priceController.text,
              model: _modelController.text,
              strength: _strengthController.text,
              volume: _volumeController.text,
            ));
            Navigator.pop(context, true);
          }
        },
        child: Icon(Icons.check), // Иконка подтверждения добавления
        backgroundColor: Colors.green,
      ),

    );
  }
}
