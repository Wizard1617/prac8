import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:avtomobile/features/home/presentation/controller/home_controller.dart';
import 'package:avtomobile/di/service.dart';
import 'package:avtomobile/features/home/presentation/ui/ByID.dart';
import 'package:avtomobile/features/home/presentation/ui/add.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => service<HomeController>()..init(),
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _search = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Пивной бар'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              context.read<HomeController>().search(_search.text);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  labelText: 'Найти напиток',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _search.clear();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeController>().init();
                },
                child: ListView.builder(
                  itemCount: context.watch<HomeController>().BeerList.length,
                  itemBuilder: (context, index) {
                    final beer = context.watch<HomeController>().BeerList[index]; // Используйте camelCase для имен переменных
                    return Card(
                      child: ListTile(
                        title: Text('Бренд: ${beer.model}'), // Пример: "Бренд: Heineken"
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Цена: ${beer.price}'), // Пример: "Цена: 100"
                            Text('Крепкость: ${beer.strength}'), // Пример: "Крепкость: 5%"
                            Text('Объём: ${beer.volume}'), // Пример: "Объём: 0.5 л"
                          ],
                        ),
                        isThreeLine: true, // Позволяет отображать три строки в subtitle
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (beer.hiveKey != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ByID(hiveKey: beer.hiveKey!)),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.push возвращает Future, результат которого можно использовать
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Add()),
          );

          // Если результат true, вызываем init для обновления данных
          if (result == true) {
            context.read<HomeController>().init();
          }
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}

