
import 'package:flutter/material.dart';
import 'package:wedding_hkn/config/flavor.dart';

import 'config/env.dart';
import 'app.dart';
import 'helper/di/di.dart';

void main() {
  initDI(ENVType.beta);
  runApp(MyApp(shouldShowDebugButton: Flavor.flavorType.isDev));
}
