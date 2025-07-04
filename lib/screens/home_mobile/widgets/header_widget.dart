part of '../home_mobile_screen.dart';

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({super.key});

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenMobileVm>().initAudioLottie(context,this);
  }

  @override
  void dispose() {
    context.read<HomeScreenMobileVm>().disposeAudioLottie();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeScreenMobileVm>();

    SizeConfig().init(context);
    final width = SizeConfig.screenWidth!;
    final height = SizeConfig.screenHeight!;

    return Consumer<HomeScreenMobileVm>(builder: (context, vm, child) {
      return Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 900,
                child: Stack(
                  children: [

                    Stack(
                      children: [
                        Stack(
                          fit: StackFit.expand,
                          children: [

                            // Ảnh nền ở dưới
                            Positioned.fill(
                              top: 140,
                              child: Image.asset(
                                Assets.png.pngOneMobile.keyName,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Gradient phủ phía trên
                            // Positioned.fill(
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       gradient: LinearGradient(
                            //         begin: Alignment.topCenter,
                            //         end: Alignment.bottomCenter,
                            //         colors: [
                            //           // Colors.white.withOpacity(1.0),
                            //           Colors.white.withOpacity(1.0),
                            //           Colors.white.withOpacity(1.0),
                            //           Colors.white.withOpacity(1.0),
                            //           Colors.white.withOpacity(0.8),
                            //           Colors.white.withOpacity(0.6),
                            //           Colors.white.withOpacity(0.4),
                            //           Colors.white.withOpacity(0.2),
                            //           Colors.transparent,
                            //           Colors.transparent,
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // Thêm logo/menu hoặc các widget khác ở đây
                          ],
                        ),
                        Positioned(
                            top: 25,
                            right: 90,

                            child:  Center(
                              child: SizedBox(
                                width: 120,
                                child: LanguageToggleButton(
                                  currentLang: vm.currentLang,
                                  onSelected: (langCode) => vm.changeLang(context, langCode),
                                ),
                              ),
                            )),
                        Positioned(
                          // left: 0,
                          top: 90,
                          right: 0,
                          left: MediaQuery.of(context).size.width >350 ? 70 : 0,

                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        S.current.name_boy,
                                        style: KSTheme.of(context)
                                            .style
                                            .ts60w500
                                            .copyWith(
                                            color: Colors.black,
                                            height: 1.0),
                                      ),
                                      SizedBox(width: 16,),
                                      Text(
                                        '&',
                                        style: KSTextStyle()
                                            .style(
                                          80,
                                          FontWeight.w400,
                                          fontBuilder:
                                          GoogleFonts.cormorantInfant,
                                        )
                                            .copyWith(
                                            color:
                                            AppStyle.primaryGray90998B),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(width: 64,)
,
                                      Text(
                                        S.current.name_girl,
                                        style: KSTheme.of(context)
                                            .style
                                            .ts60w500
                                            .copyWith(
                                            color: Colors.black,
                                            height: 1.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${S.current.my_love_story}\n${S.current.step_arrangement}',
                                        textAlign: TextAlign.right,
                                        style: KSTextStyle().style(
                                          18,
                                          FontWeight.w500,
                                          fontBuilder:
                                          GoogleFonts.cormorantInfant,
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      MouseRegion(
                                        onEnter: (_) => vm.setHover(true),
                                        onExit: (_) => vm.setHover(false),
                                        child: AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 300),
                                          switchInCurve: Curves.easeInOut,
                                          switchOutCurve: Curves.easeInOut,
                                          transitionBuilder: (child, animation) {
                                            return FadeTransition(opacity: animation, child: child);
                                          },
                                          child: vm.isb
                                              ? _buildLottieButton(key: const ValueKey('lottie'), hovered: vm.isHover, vm:vm)
                                              : _buildPlayButton(key: const ValueKey('icon'), hovered: vm.isHover, vm:vm),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 16,),


                                ],
                              ),
                            ),
                          ),),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                Assets.svg.svgLogo.keyName,
                                width: 50,
                                height: 50,
                              ),

                              // SvgPicture.asset(
                              //   Assets.svg.svgMenu.keyName,
                              //   // width: width * 0.05,
                              //   // height: height * 0.05,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ExpandableRevealPanel(
                      key: vm.panelKey,
                      blackLottieAsset: Assets.json.jsonMenu,
                      whiteLottieAsset: Assets.json.jsonMenuWhite,
                      targetHeight: 950,
                      content: Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              Assets.svg.svgLogo.keyName,
                              width: 50,
                              height: 50,
                              color: AppStyle.whiteBg,
                            ),
                            Center(
                              child: Container(
                                width: width * 0.8,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 64,
                                    ),
                                    KSInkWellUnFocus(
                                      onTap: () {
                                        vm.scrollToTarget(vm.infoKey);
                                      },
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: KSText(
                                          S.current.menu_info,
                                          style: KSTheme.of(context)
                                              .style
                                              .ts35w500
                                              .copyWith(
                                                  color: AppStyle.whiteBg),
                                        ),
                                      ),
                                    ),
                                    KSInkWellUnFocus(
                                      onTap: () {
                                        vm.scrollToTarget(vm.loveKey);
                                      },
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: KSText(
                                          S.current.menu_love,
                                          style: KSTheme.of(context)
                                              .style
                                              .ts35w500
                                              .copyWith(
                                                  color: AppStyle.whiteBg),
                                        ),
                                      ),
                                    ),
                                    KSInkWellUnFocus(
                                      onTap: () async {
                                        vm.scrollToTarget(vm.scheduleKey);
                                      },
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: KSText(
                                          S.current.menu_schedule,
                                          style: KSTheme.of(context)
                                              .style
                                              .ts35w500
                                              .copyWith(
                                                  color: AppStyle.whiteBg),
                                        ),
                                      ),
                                    ),
                                    KSInkWellUnFocus(
                                      onTap: () {
                                        vm.scrollToTarget(vm.goKey);
                                      },
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${S.current.menu_comfirm}\n',
                                                style: KSTheme.of(context)
                                                    .style
                                                    .ts35w500
                                                    .copyWith(color: AppStyle.whiteBg),
                                              ),

                                              TextSpan(
                                                text: '  ${  S.current.menu_ok}',
                                                style: KSTheme.of(context)
                                                    .style
                                                    .ts35w500
                                                    .copyWith(color: AppStyle.primaryGreen617856),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left, // hoặc center, tùy bạn
                                        )

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                bottom: -80, // dính hẳn lên trên nếu cần
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: TopHalfOvalClipper(curveDepth: 0.3),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppStyle.primaryGreen11150F,
                          AppStyle.primaryGreen11150F,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(
                  child:  MouseRegion(
                    hitTestBehavior: HitTestBehavior.translucent,
                    onEnter: (_) => vm.setHover(true),
                    onExit: (_) => vm.setHover(false),
                    child:    Column(
                      children: [
                        KSInkWellUnFocus(
                          onTap: (){
                            vm.scrollToTarget(vm.timeKey);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  //                   <--- border color
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: AppStyle.padding_all_8(),
                                child: SvgPicture.asset(
                                  Assets.svg.svgArrowDown.keyName,
                                  width: 35,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          S.current.watch_now,
                          style: KSTextStyle()
                              .style(
                            20,
                            FontWeight.w400,
                            fontBuilder: GoogleFonts.cormorantInfant,
                          )
                              .copyWith(color: AppStyle.whiteBg),
                        ),
                      ],
                    ),

                  ),

                ),
              ),
            ],
          ),
        Column(
          children: [
            Transform.translate(
              offset: Offset(0, -1),
              child: Container(
                key:vm.timeKey,
                // height: 600,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppStyle.primaryGreen11150F,
                      AppStyle.primaryGreen11150F,
                      AppStyle.primaryGreen647B58,
                      AppStyle.primaryGreen647B58,
                      AppStyle.whiteBg,
                    ],
                  ),
                ),
                child: Padding(
                  padding: AppStyle.padding_LR_8(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 128,
                          ),
                          KSText(S.current.countdown,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: KSTheme.of(context)
                                  .style
                                  .ts42w500
                                  .copyWith(color: AppStyle.whiteBg)),
                          KSText(
                            textAlign: TextAlign.center,
                            S.current.line_one,
                            style: KSTextStyle()
                                .style(
                              15,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.cormorantInfant,
                            )
                                .copyWith(color: AppStyle.primaryGray90998B),
                          ),
                          // KSText(
                          //   textAlign: TextAlign.center,
                          //   '',
                          //   style: KSTextStyle()
                          //       .style(
                          //         18,
                          //         FontWeight.w400,
                          //         fontBuilder: GoogleFonts.cormorantInfant,
                          //       )
                          //       .copyWith(color: AppStyle.primaryGray90998B),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      if(MediaQuery.of(context).size.width >400)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimeColumn(
                          size: 25.sp,
                            ver: 6,
                            topLeft: vm.dayTens.toString(),
                            topRight: vm.dayUnits.toString(),
                            label: S.current.day,
                          ),
                          const SizedBox(width: 16),
                          TimeColumn(
                            ver: 6,
                            size: 25.sp,
                            topLeft: vm.hourTens.toString(),
                            topRight: vm.hourUnits.toString(),
                            label: S.current.hour,
                          ),
                          const SizedBox(width: 16),
                          TimeColumn(
                            ver: 6,
                            size: 25.sp,
                            topLeft: vm.minuteTens.toString(),
                            topRight: vm.minuteUnits.toString(),
                            label: S.current.min,
                          ),
                        ],
                      ),
                      if(MediaQuery.of(context).size.width <400)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TimeColumn(
                                  size: 25.sp,
                                  ver: 6,
                                  topLeft: vm.dayTens.toString(),
                                  topRight: vm.dayUnits.toString(),
                                  label: S.current.day,
                                ),
                                const SizedBox(width: 16),
                                TimeColumn(
                                  ver: 6,
                                  size: 25.sp,
                                  topLeft: vm.hourTens.toString(),
                                  topRight: vm.hourUnits.toString(),
                                  label: S.current.hour,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            /// 👇 Sửa ở đây: bọc bằng Row để canh giữa
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TimeColumn(
                                  ver: 6,
                                  size: 25.sp,
                                  topLeft: vm.minuteTens.toString(),
                                  topRight: vm.minuteUnits.toString(),
                                  label: S.current.min,
                                ),
                              ],
                            ),
                          ],
                        )
              ,
                      Container(
                        key: vm.infoKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 128,
                            ),
                            KSText(  S.current.hundred_years_of_love,textAlign: TextAlign.center,
                                style: KSTheme.of(context)
                                    .style
                                    .ts42w500
                                    .copyWith(color: AppStyle.whiteBg)),
                            KSText(
                              textAlign: TextAlign.center,
                              S.current.line_two,
                              style: KSTextStyle()
                                  .style(
                                15,
                                FontWeight.w400,
                                fontBuilder: GoogleFonts.cormorantInfant,
                              )
                                  .copyWith(color: AppStyle.primaryGray90998B),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 64,),
                      CrossScrollDrivenAnimationMobile(
                        onScrollLockChanged: vm.setScrollLock,
                        scrollController: vm.scrollController,
                        leftBoxWidth: 0.5 * width,
                        leftBoxHeight: 500,
                        rightBoxWidth: 0.5 * width,
                        rightBoxHeight: 500,
                        // redBox: Image.asset(
                        //   Assets.png.pngMobile.keyName,
                        // ),
                        redBox: Container(),
                        rightBox: Image.asset(
                          Assets.png.pngAnhthinh.keyName,
                        ),
                        leftBox: Image.asset(
                          Assets.png.pngChinha.keyName,
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 128 + 128 + 128 + 64,
                        child: Stack(
                          children: vm.bubbles.map((bubble) {
                            return FlyingChatBubble(
                              hide: vm.hide,
                              key: ValueKey(bubble),
                              // Để đảm bảo widget không bị tái sử dụng sai
                              data: bubble,
                              onCompleted: () {
                                setState(() => vm.bubbles.remove(bubble));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            // KSButton("f",onTap: (){
                            //   _addManyBubbles();
                            // },),
                            SizedBox(
                              height: 64,
                            ),
                            Column(
                              children: [
                                KSText(S.current.wishes_loves,
                                    textAlign: TextAlign.center,
                                    style: KSTheme.of(context)
                                        .style
                                        .ts42w500
                                        .copyWith(color: AppStyle.whiteBg)),
                                SizedBox(
                                  height: 16,
                                ),
                                KSText(
                                  textAlign: TextAlign.center,
                                  S.current.line_three,
                                  style: KSTextStyle()
                                      .style(
                                    15,
                                    FontWeight.w400,
                                    fontBuilder: GoogleFonts.cormorantInfant,
                                  )
                                      .copyWith(color: AppStyle.whiteBg),
                                ),
                                KSText(
                                  textAlign: TextAlign.center,
                                  S.current.line_three_add,
                                  style: KSTextStyle()
                                      .style(
                                    15,
                                    FontWeight.w400,
                                    fontBuilder: GoogleFonts.cormorantInfant,
                                  )
                                      .copyWith(color: AppStyle.whiteBg),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Container(
                              width:   width,
                              decoration: BoxDecoration(
                                color: AppStyle.primaryGrayB8C1B2,
                                border: Border.all(width: 1, color: Colors.black),
                                // borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: AppStyle.padding_all_16()
                                      .copyWith(left: 32, right: 32),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          KSText(S.current.sending_love,
                                              style: KSTextStyle()
                                                  .style(
                                                18,
                                                FontWeight.w600,
                                                fontBuilder:
                                                GoogleFonts.cormorantInfant,
                                              )
                                                  .copyWith(
                                                  color: AppStyle
                                                      .primaryGreen41483D)),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          TextField(
                                            onTap: (){

                                              EmojiPopupController().hide();
                                            },
                                            controller: vm.usernameController,
                                            decoration: InputDecoration(
                                              hintText:
        S.current.ex_who_sending_love,
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 14),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(
                                                    8), // 👈 Bo tròn
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.black87,
                                                    width: 1.5),
                                              ),
                                            ),
                                            style: KSTextStyle()
                                                .style(
                                              15,
                                              FontWeight.w400,
                                              fontBuilder:
                                              GoogleFonts.cormorantInfant,
                                            )
                                                .copyWith(
                                                color:
                                                AppStyle.primaryGray8D8D8D),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          KSText(
                                              S.current.enter_wish,
                                              style: KSTextStyle()
                                                  .style(
                                                18,
                                                FontWeight.w600,
                                                fontBuilder:
                                                GoogleFonts.cormorantInfant,
                                              )
                                                  .copyWith(
                                                  color: AppStyle
                                                      .primaryGreen41483D)),
                                          SizedBox(
                                            height: 8,
                                          ),

                                          EmojiTextFieldMobile(onChanged: (String x){

                                            vm.cmtContoller.text = x;
                                          },),
                                          // TextField(
                                          //   controller: vm.cmtContoller,
                                          //   minLines: 5,
                                          //   maxLines: 7,
                                          //   decoration: InputDecoration(
                                          //     hintText: "Nhập lời chúc của bạn",
                                          //     filled: true,
                                          //     hintStyle: KSTextStyle()
                                          //         .style(
                                          //       15,
                                          //       FontWeight.w400,
                                          //       fontBuilder:
                                          //       GoogleFonts.cormorantInfant,
                                          //     )
                                          //         .copyWith(
                                          //         color:
                                          //         AppStyle.primaryGray8D8D8D),
                                          //     fillColor: Colors.white,
                                          //     contentPadding:
                                          //     const EdgeInsets.symmetric(
                                          //         horizontal: 16, vertical: 12),
                                          //     border: OutlineInputBorder(
                                          //       borderRadius:
                                          //       BorderRadius.circular(8),
                                          //       borderSide: BorderSide
                                          //           .none, // 👈 không có viền
                                          //     ),
                                          //     focusedBorder: OutlineInputBorder(
                                          //       borderRadius:
                                          //       BorderRadius.circular(8),
                                          //       borderSide: const BorderSide(
                                          //           color: Colors.black),
                                          //     ),
                                          //   ),
                                          //   style: KSTextStyle()
                                          //       .style(
                                          //     15,
                                          //     FontWeight.w400,
                                          //     fontBuilder:
                                          //     GoogleFonts.cormorantInfant,
                                          //   )
                                          //       .copyWith(
                                          //       color:
                                          //       AppStyle.primaryGray8D8D8D),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      MouseRegion(
                                        hitTestBehavior: HitTestBehavior.translucent,
                                        onEnter: (_) => vm.setHover(true),
                                        onExit: (_) => vm.setHover(false),
                                        child:    AnimatedScale(
                                          duration: const Duration(milliseconds: 200),
                                          scale:  vm.isHover ? 1.1 : 1.0,
                                          child: SizedBox(
                                              width: 100,
                                              height: 35,
                                              child: KSButton(
                                                onTap: () {
                                                  EmojiPopupController().hide();
                                                  vm.postWish(context);
                                                },
                                                S.current.send_now,
                                                backgroundColor:
                                                AppStyle.primaryColorBlack,
                                              )),
                                        ),

                                      ),

                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        key: vm.loveKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 128,
                            ),
                            KSText(S.current.moment_of_love,textAlign: TextAlign.center,
                                maxLines: 2,
                                style: KSTheme.of(context)
                                    .style
                                    .ts42w500
                                    .copyWith(color: AppStyle.whiteBg)),
                            KSText(
                              textAlign: TextAlign.center,
                              S.current.line_four,
                              style: KSTextStyle()
                                  .style(
                                15,
                                FontWeight.w400,
                                fontBuilder: GoogleFonts.cormorantInfant,
                              )
                                  .copyWith(color: AppStyle.whiteBg),
                            ),
                            SizedBox(
                              height: 64,
                            ),
                            if(vm.listImg.isNotEmpty)
                            Container(
                              child: GroupedFocusCarouselMobile(
                                onTap: (int index) async {






                                  showMessagePopupMobile(
                                    context,
                                    vm,
                                  );
                                  await vm.findImg(index, context);
                                },
                                imagePaths: vm.listImg.map((e) => e.url).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              key: vm.scheduleKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 128,
                  ),
                  Column(
                    children: [
                      KSText(  S.current.event_schedule,
                          textAlign: TextAlign.center,
                          style: KSTheme.of(context)
                              .style
                              .ts42w500
                              .copyWith(color: AppStyle.primaryColorBlack)),
                      SizedBox(
                        height: 16,
                      ),
                      KSText(
                        textAlign: TextAlign.center,
                        S.current.line_four,
                        style: KSTextStyle()
                            .style(
                          15,
                          FontWeight.w400,
                          fontBuilder: GoogleFonts.cormorantInfant,
                        )
                            .copyWith(color: AppStyle.primaryColorBlack),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TimelineIndicator(
                      isLast: true,
                      lineBottomHeight: 420 + 200,
                    ),
                    TimelineItemWidgetMobile(
                      title: S.current.item_one_name,
                      date:  S.current.item_one_date,
                      location:  S.current.item_one_address,
                      description:
                      S.current.item_one_detail,
                      imagePath: Assets.png.pngAddress1.keyName,
                      onTap: () {
                        vm.launchMap(
                            'https://www.google.com/maps/place/Th%C3%A1nh+T%C3%A2m+Church/@11.9373552,108.4279243,17z/data=!3m1!4b1!4m6!3m5!1s0x31711332f4b06465:0x7dda4f11c97145b1!8m2!3d11.9373552!4d108.4305046!16s%2Fg%2F1hc4pfztq?entry=ttu&g_ep=EgoyMDI1MDYyMy4yIKXMDSoASAFQAw%3D%3D');
                        // điều hướng hoặc hiển thị bản đồ
                      },
                    ),
                  ],
                ),
                // SizedBox(height: 32,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimelineIndicator(
                      isFirst: true,
                      isLast: true,
                      lineTopHeight: 400,
                      lineBottomHeight: 250,
                    ),
                    TimelineItemWidgetMobile(
                      title: S.current.item_two_name,
                      date:  S.current.item_two_date,
                      location:  S.current.item_two_address,
                      description:
                      S.current.item_two_detail,

                      imagePath: Assets.png.pmgAddress2Mobile.keyName,
                      onTap: () {
                        vm.launchMap(
                            'https://www.google.com/maps/place/N%E1%BA%A5m+Spa/@11.9325443,108.4241363,1243m/data=!3m1!1e3!4m15!1m8!3m7!1s0x31716ccb417082c7:0x2daa876acb2d7102!2zMTAgxJAuIE5nw7QgVGjDrCBT4bu5LCBQaMaw4budbmcgNCwgxJDDoCBM4bqhdCwgTMOibSDEkOG7k25nLCBWaeG7h3QgTmFt!3b1!8m2!3d11.9324907!4d108.4263386!16s%2Fg%2F11sz5h2np6!3m5!1s0x31716d0033d8b265:0x776039a070bacbd5!8m2!3d11.9324907!4d108.4263386!16s%2Fg%2F11x5smy6n7?entry=ttu&g_ep=EgoyMDI1MDYyMy4yIKXMDSoASAFQAw%3D%3D');
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimelineIndicator(
                      isFirst: true,
                      lineTopHeight: 250,
                    ),
                    TimelineItemWidgetMobile(
                      title: S.current.item_three_name,
                      date:  S.current.item_three_date,
                      location:  S.current.item_three_address,
                      description:
                      S.current.item_three_detail,

                      imagePath: Assets.png.pngAddress3.keyName,
                      onTap: () {
                        vm.launchMap(
                            "https://www.google.com/maps/place/19+Nguy%E1%BB%85n+Du,+Ph%C6%B0%E1%BB%9Dng+9,+%C4%90%C3%A0+L%E1%BA%A1t,+L%C3%A2m+%C4%90%E1%BB%93ng+66111,+Vi%E1%BB%87t+Nam/@11.9482511,108.4623231,213m/data=!3m1!1e3!4m25!1m13!3m12!1s0x317112e2b73cdf81:0xb085d9301bef1d70!2zNTYgUXVhbmcgVHJ1bmcsIFBoxrDhu51uZyA5LCDEkMOgIEzhuqF0LCBMw6JtIMSQ4buTbmcgNjAwMDEsIFZp4buHdCBOYW0!3b1!5m4!1s2025-07-14!2i5!4m1!1i2!8m2!3d11.9486193!4d108.4626061!16s%2Fg%2F11y8dybqxb!3m10!1s0x317112e2ac3cadf3:0x4d1d5d402a68214a!5m4!1s2025-07-14!2i5!4m1!1i2!8m2!3d11.9479459!4d108.4628879!16s%2Fg%2F11qbks8wxg?entry=ttu&g_ep=EgoyMDI1MDYyMy4yIKXMDSoASAFQAw%3D%3D");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
          SizedBox(
            height: 64,
          )
        ],
      );
    });
  }
  Widget _buildLottieButton({required Key key, required bool hovered,  required HomeScreenMobileVm vm}) {
    return KSInkWellUnFocus(
      key: key,
      radius: 360,
      onTap: () {
        vm.toggleAudioLottie();
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: hovered ? 1.1 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Lottie.asset(
              Assets.json.jsonVolume,
              controller: vm.lottieController,
              onLoaded: (composition) {
                vm.setLottieDuration(composition.duration);
              },
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildPlayButton({required Key key, required bool hovered , required HomeScreenMobileVm vm}) {
    return KSInkWellUnFocus(
      key: key,
      radius: 360,
      onTap: () {
        vm.setPlay();
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: hovered ? 1.1 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(Icons.play_arrow_outlined),
          ),
        ),
      ),
    );
  }
}

class TopHalfOvalClipper extends CustomClipper<Path> {
  final double curveDepth; // Tùy chỉnh độ cong

  TopHalfOvalClipper({this.curveDepth = 0.3}); // mặc định 30%

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height * curveDepth);
    path.quadraticBezierTo(
      size.width / 2,
      -size.height * curveDepth, // 🔥 cong hơn
      size.width,
      size.height * curveDepth,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}



void showMessagePopup(BuildContext context, HomeScreenVm vm) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Popup",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return ChangeNotifierProvider.value(
        value: vm,
        child: const MessagePopupDialog(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved =
      CurvedAnimation(parent: animation, curve: Curves.easeOutBack);

      return ScaleTransition(
        scale: curved,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );


}



void showMessagePopupMobile(BuildContext context, HomeScreenMobileVm vm) {

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Popup",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return ChangeNotifierProvider.value(
        value: vm,
        child: const MessagePopupDialogMobile(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved =
      CurvedAnimation(parent: animation, curve: Curves.easeOutBack);


      return ScaleTransition(
        scale: curved,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );


}
