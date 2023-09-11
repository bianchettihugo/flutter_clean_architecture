import 'package:get_it/get_it.dart';

class Dependency {
  static T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  static void register<T extends Object>(T instance) {
    GetIt.I.registerSingleton<T>(instance);
  }

  static void registerLazy<T extends Object>(T instance) {
    return GetIt.I.registerLazySingleton<T>(() => instance);
  }
}
