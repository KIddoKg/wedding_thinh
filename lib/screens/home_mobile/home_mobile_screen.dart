import 'dart:developer';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_sheet_scroll_physics/bottom_sheet_scroll_physics.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:wedding_hkn/generated/l10n.dart';
import 'package:wedding_hkn/screens/home/viewModel/home_screen_vm.dart';
import 'package:wedding_hkn/screens/home_mobile/viewModel/home_screen_vm.dart';
import 'package:wedding_hkn/share/share_on_app.dart';
import 'package:wedding_hkn/share/size_configs.dart';

import '../../share/app_imports.dart';
import '../../share/text_style.dart';
import 'package:lottie/lottie.dart';

part '../home_mobile/widgets/header_widget.dart';
part '../home_mobile/widgets/confirm_widget.dart';
part '../home_mobile/widgets/footer_widget.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    final HomeScreenMobileVm _vm = di<HomeScreenMobileVm>();

    return ChangeNotifierProvider.value(
      value: _vm, // Provide the same instance from DI to the widget tree
      child: HomeScreenMobileContent(),
    );
  }
}

class HomeScreenMobileContent extends StatefulWidget {
  const HomeScreenMobileContent({super.key});

  @override
  State<HomeScreenMobileContent> createState() => _HomeScreenMobileContentState();
}

class _HomeScreenMobileContentState extends State<HomeScreenMobileContent> {
  @override
  void initState() {


    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final vm = Provider.of<HomeScreenMobileVm>(context, listen: false);
      vm.getWishCMT(context);
      // vm.scrollController = ScrollController();

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenMobileVm>(
      builder: (context, vm, child) {
        return KSScaffold(
          onTap: (){
            EmojiPopupController().hide();
            vm.setPlay();
          },
          child: CustomScrollView(
        physics:const ClampingScrollPhysics(),
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


