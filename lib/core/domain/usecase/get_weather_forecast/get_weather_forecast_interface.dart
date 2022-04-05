import 'package:previsao_tempo_triple/core/domain/entities/weather_entity.dart';

abstract class IGetWeatherForecast {
  Future<WeatherEntity> featchWeatherForecast(String city);
}
