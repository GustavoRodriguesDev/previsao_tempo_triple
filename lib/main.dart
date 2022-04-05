import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo_triple/core/app_modular.dart';
import 'package:previsao_tempo_triple/core/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
