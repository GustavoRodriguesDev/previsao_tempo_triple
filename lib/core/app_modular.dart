import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo_triple/core/presenter/ui/store/forecast_page_store.dart';
import 'package:uno/uno.dart';

import 'data/external/datasourcer/weather_forecast_datasource.dart';
import 'data/infra/repository/weather_forecast_repository.dart';
import 'domain/usecase/get_weather_forecast/get_weather_forecast.dart';
import 'presenter/ui/forecast_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => WeatherForecastDatasource(i())),
        Bind((i) => WeatherForecastRepository(i())),
        Bind((i) => WeatherForecastUseCase(i())),
        Bind((i) => ForecastPageStore(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ForecasPage(),
        )
      ];
}
