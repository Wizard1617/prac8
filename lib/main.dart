import 'package:avtomobile/di/service.dart';
import 'package:avtomobile/features/home/app.dart';
import 'package:avtomobile/features/home/data/model/beer_model_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BeerModelAdapter());
  await initDJ();
  runApp(const App());
}