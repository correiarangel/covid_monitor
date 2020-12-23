
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'core/interface/client_http_interface.dart';
import 'core/repositories/api_covid_repository.dart';
import 'core/repositories/interface/api_covid_repository_inteface.dart';
import 'core/services/dio_services.dart';
import 'pages/home/controller/home_controller.dart';
import 'pages/home/home_page.dart';
import 'pages/splash/splash_page.dart';

class AppModule extends MainModule {
  
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()), //usando bloc
        Bind<IClientHttp>((i) => DioServices()),
        Bind<IApiCoviReposytory>((i) => ApiCovidRepository(i.get())),
      ];

  // rotas do módulo
  @override
  List<ModularRouter> get routers => [
        ModularRouter('/',
            transition: TransitionType.rotate,
            child: (context, args) => SplashPage()),
        ModularRouter("/home", child: (_, args) => HomePage()),
      ];

  //widget principal
  @override
  Widget get bootstrap => AppWidget();
}
