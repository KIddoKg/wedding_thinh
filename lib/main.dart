import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:wedding_hkn/services/notification_services.dart';
import 'package:wedding_hkn/share/share_on_app.dart';

import 'app.dart';
import 'config/env.dart';
import 'config/flavor.dart';
import 'generated/l10n.dart';
import 'helper/di/di.dart';
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
import 'dart:html' as html;
void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await initDI(ENVType.prod);

    runApp(
      MyApp(shouldShowDebugButton: Flavor.flavorType.isProd),
    );
    // Lắng nghe khi resize
    WidgetsBinding.instance.addPostFrameCallback((_) {
      html.document.title = "Thịnh 💍 Hân";
    });
    await Future.delayed(Duration(seconds: 2), () {
      showSplashFor(Duration(seconds: 0));
    });

    // html.window.onResize.listen((event) {
    //   EmojiPopupController().hide();
    //
    //   showSplashFor(Duration(seconds: 1));
    // });

    forceSetTitle();
    startTitleKeeper()
;
  }, (error, trace) {
    log('[DEV] Error while running app', time: DateTime.now(), error: error, stackTrace: trace);
  });
}
void startTitleKeeper() {
  Timer.periodic(const Duration(seconds: 2), (timer) {
    if (html.document.title != "${S.current.name_boy_one} 💍 ${S.current.name_girl_one}") {
      html.document.title = "${S.current.name_boy_one} 💍 ${S.current.name_girl_one}";
    }
  });
}


void forceSetTitle() {
  html.document.title = "${S.current.name_boy_one} 💍 ${S.current.name_girl_one}";
}

void showSplashFor(Duration duration) {
  final splash = html.document.getElementById('loading-splash');


  if (splash != null) {
    // Reset style trước khi hiển
    splash.style
      ..opacity = '1'
      ..display = 'flex'
      ..transition = 'opacity 0.5s ease-out'
      ..transform = 'none' // Chặn scale hoặc hiệu ứng cũ
      ..animation = 'none'; // Nếu có animation CSS, tắt nó đi

    // Sau thời gian delay, ẩn đi
    Future.delayed(duration, () {
      splash.style.opacity = '0';
      Future.delayed(Duration(milliseconds: 500), () {
        splash.style.display = 'none';
      });
    });
  }
}

