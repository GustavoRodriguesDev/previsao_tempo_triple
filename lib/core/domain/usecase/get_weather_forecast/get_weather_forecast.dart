import 'package:previsao_tempo_triple/core/domain/entities/weather_entity.dart';
import 'package:previsao_tempo_triple/core/domain/repository/weather_forecast_repository_interface.dart';

import 'get_weather_forecast_interface.dart';

class WeatherForecastUseCase implements IGetWeatherForecast {
  final IWatherForecastRepository repository;
  WeatherForecastUseCase(this.repository);
  @override
  Future<WeatherEntity> featchWeatherForecast(String city) async {
    return await repository.getWheaterForecast(city);
  }
}
