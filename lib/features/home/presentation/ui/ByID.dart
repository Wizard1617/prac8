import 'package:avtomobile/di/service.dart';
import 'package:avtomobile/features/home/presentation/controller/home_controller.dart';
import 'package:avtomobile/features/home/presentation/ui/home.dart';
import 'package:avtomobile/features/home/presentation/ui/update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ByID extends StatelessWidget {
  final int hiveKey;

  const ByID({Key? key, required this.hiveKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => service<HomeController>()..id(hiveKey),
      child: _ByID(index: hiveKey),
    );
  }
}

class _ByID extends StatelessWidget {
  final int index;

  const _ByID({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = context.watch<HomeController>().Beer; // Используйте camelCase для имен переменных

    return Scaffold(
      appBar: AppBar(
        title: Text('Детали продукта'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Update(index: index)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final beerHiveKey = beer?.hiveKey;
              if (beerHiveKey != null) {
                final controller = context.read<HomeController>();
                controller.deleteById(beerHiveKey);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Невозможно удалить продукт без идентификатора."))
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Чтобы колонка занимала минимум места
                  crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание текста по левому краю
                  children: [
                    Text('Цена: ${beer?.price ?? 'Не указан'}', style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8),
                    Text('Бренд: ${beer?.model ?? 'Не указан'}', style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8),
                    Text('Крепкость: ${beer?.strength ?? 'Не указана'}', style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8),
                    Text('Объём: ${beer?.volume ?? 'Не указано'}', style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}


