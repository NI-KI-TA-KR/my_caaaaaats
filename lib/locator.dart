import 'package:cat_app/services/cats_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup(){
  sl.registerLazySingleton<CatsService>(() => CatsServiceImpl());
}