import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:previsao_tempo_triple/core/domain/entities/weather_entity.dart';
import 'package:previsao_tempo_triple/core/presenter/ui/store/forecast_page_store.dart';
import 'package:previsao_tempo_triple/core/presenter/ui/widget/climate_day.dart';
import 'package:previsao_tempo_triple/core/presenter/ui/widget/climate_next_days.dart';
import 'package:previsao_tempo_triple/core/utils/const.dart';

class ForecasPage extends StatefulWidget {
  const ForecasPage({Key? key}) : super(key: key);

  @override
  State<ForecasPage> createState() => _ForecasPageState();
}

class _ForecasPageState extends State<ForecasPage> {
  final ForecastPageStore store = Modular.get<ForecastPageStore>();

  @override
  void initState() {
    super.initState();
    store.searchCity('Nova Campina');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: height,
                alignment: Alignment.topCenter,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF81B9DD),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          onChanged: (value) => store.city = value,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                store.searchCity(store.city);
                              },
                              child: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ScopedBuilder<ForecastPageStore, Exception, WeatherEntity>(
                      store: store,
                      onState: (context, state) {
                        return Column(
                          children: [
                            ClimateDay(
                              description: state.description,
                              city: store.city,
                              height: height * 0.64,
                              width: width,
                              temp: state.temperature,
                              wind: state.wind,
                              image: store.selectImage(state.description),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Container(
                                height: height * 0.19,
                                width: width,
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text('Day:', style: textStyle),
                                        SizedBox(height: 6),
                                        Text('Temperature:', style: textStyle),
                                        SizedBox(height: 6),
                                        Text('Wind:', style: textStyle),
                                      ],
                                    ),
                                    SizedBox(width: width * 0.05),
                                    ClimateNextDays(
                                        width: width, forecast: state.forecast, itemCount: state.forecast.length),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      onError: (context, error) => Text(error.toString()),
                      onLoading: (context) => const CircularProgressIndicator(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
