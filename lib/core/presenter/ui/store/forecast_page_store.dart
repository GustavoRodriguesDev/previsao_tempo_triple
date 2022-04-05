import 'package:flutter_triple/flutter_triple.dart';
import 'package:previsao_tempo_triple/core/domain/entities/weather_entity.dart';
import 'package:previsao_tempo_triple/core/domain/usecase/get_weather_forecast/get_weather_forecast_interface.dart';

class ForecastPageStore extends StreamStore<Exception, WeatherEntity> {
  final IGetWeatherForecast usecase;

  String city = 'Nova Campina';
  ForecastPageStore(this.usecase)
      : super(const WeatherEntity(description: '', forecast: [], temperature: '', wind: ''));

  Future<void> searchCity(String city) async {
    setLoading(true);
    try {
      final forecast = await usecase.featchWeatherForecast(city);

      update(forecast);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  String selectImage(String climate) {
    if (climate == 'Light rain') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (climate == 'Light rain shower' || climate == 'Light drizzle') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (climate == 'Sunny' || climate == 'Clear') {
      return 'assets/climate/sunny.png';
    } else if (climate == 'Partly cloudy') {
      return 'assets/climate/partly_cloudy.png';
    } else if (climate == 'Patchy rain possible') {
      return 'assets/climate/patchy_rain_possible_climate.png';
    } else if (climate == 'Rain') {
      return 'assets/climate/rain.png';
    }
    return '';
  }
}
