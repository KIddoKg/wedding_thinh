import '../share/app_imports.dart';
import 'home/home_screen.dart';
import 'home_mobile/home_mobile_screen.dart';

class HomeScreenAdaptive extends StatelessWidget {
  const HomeScreenAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.maxWidth;

        if (width < 280) {
          return Container(); // Trường hợp quá hẹp
        } else if (width < 600) {
          return const HomeScreenMobile();
        } else {
          return const HomeScreen();
        }
      },
    );

  }
}
