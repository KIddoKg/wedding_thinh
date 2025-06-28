import 'dart:developer';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_hkn/screens/home/viewModel/home_screen_vm.dart';
import 'package:wedding_hkn/share/share_on_app.dart';
import 'package:wedding_hkn/share/size_configs.dart';

import '../../share/app_imports.dart';
import '../../share/text_style.dart';
import 'package:lottie/lottie.dart';

part './widgets/header_widget.dart';
part './widgets/confirm_widget.dart';
part './widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeScreenVm _vm = di<HomeScreenVm>();

    return ChangeNotifierProvider.value(
      value: _vm, // Provide the same instance from DI to the widget tree
      child: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {


    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final vm = Provider.of<HomeScreenVm>(context, listen: false);
      vm.getWishCMT(context);


    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenVm>(
      builder: (context, vm, child) {
        return KSScaffold(
          onTap: (){
            // vm.setPlay();
          },
          child: CustomScrollView(
            physics: vm.lockScroll
                ? const NeverScrollableScrollPhysics()
                : const ClampingScrollPhysics(),
            controller: vm.scrollController,
            slivers: [

              const SliverToBoxAdapter(child: _HeaderWidget()),
              const SliverToBoxAdapter(child: _ConfirmWidget()),
              const SliverToBoxAdapter(child: _FooterWidget()),
            ],
          ),
        );
      },
    );
  }

}


