import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_init.config.dart';


// @module
// abstract class InjectionModule {
// //injecting third party libraries
//   @preResolve
//   Future<SharedPreferences> get sp => SharedPreferences.getInstance();
// }


final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
