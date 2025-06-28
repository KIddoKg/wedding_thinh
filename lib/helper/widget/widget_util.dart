import 'package:wedding_hkn/share/app_imports.dart';


abstract class BaseState<T extends StatefulWidget> extends State<T> {
  WidgetUtil get widgetUtil => di<WidgetUtil>();

  // FCMUtil get fcmUtil => di();

  Route get route => di();
}
