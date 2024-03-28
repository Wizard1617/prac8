import 'package:avtomobile/features/home/data/data_source/home_local_data_source.dart';
import 'package:avtomobile/features/home/data/repository/home_repository_impl.dart';
import 'package:avtomobile/features/home/domain/repository/home_repository.dart';
import 'package:avtomobile/features/home/domain/use_case/home_use_case.dart';
import 'package:avtomobile/features/home/presentation/controller/home_controller.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;

Future<void> initDJ() async {
  // StateManagment -> Provider Cubit Bloc GetX

  service.registerFactory(() => HomeController(service()));

  // UseCase

  service.registerLazySingleton(() => HomeUseCase(service()));

  // Repository

  service.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
  service.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(dataSource: service()));

  // External -> Dio Http Hive SharedPrefrences
}