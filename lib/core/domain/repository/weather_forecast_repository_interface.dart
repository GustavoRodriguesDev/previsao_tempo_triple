import 'package:previsao_tempo_triple/core/data/infra/model/weather_forecast_model.dart';

abstract class IWatherForecastRepository {
  Future<WeatherForecastModel> getWheaterForecast(String city);
}
