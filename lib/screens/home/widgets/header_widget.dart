part of '../home_screen.dart';

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
    context.read<HomeScreenVm>().initAudioLottie(this);
  }

  @override
  void dispose() {
    context.read<HomeScreenVm>().disposeAudioLottie();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeScreenVm>();

    SizeConfig().init(context);
    final width = SizeConfig.screenWidth!;
    final height = SizeConfig.screenHeight!;

    return Consumer<HomeScreenVm>(builder: (context, vm, child) {
      return Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 720,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            // PHẦN ẢNH

                            Expanded(
                              flex: 7,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // Ảnh nền
                                  Positioned.fill(
                                    child: Image.asset(
                                      Assets.png.pngOne.keyName,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // Gradient trắng
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Colors.white.withOpacity(1.0),
                                            Colors.white.withOpacity(0.8),
                                            Colors.white.withOpacity(0.6),
                                            Colors.white.withOpacity(0.4),
                                            Colors.white.withOpacity(0.2),
                                            Colors.transparent,
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Logo và Menu
                                ],
                              ),
                            ),

                            // PHẦN CHỮ
                            Expanded(
                              flex: 3,
                              child: Transform.translate(
                                offset: Offset(-4, 0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0)
                                      .copyWith(left: 1),
                                  child: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          // left: 0,
                          top: 160,
                          right: 60,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gia Thịnh',
                                      style: KSTheme.of(context)
                                          .style
                                          .ts70w500
                                          .copyWith(
                                              color: Colors.black, height: 1.0),
                                    ),
                                  ],
                                ),
                                Text(
                                  '&',
                                  style: KSTextStyle()
                                      .style(
                                        40,
                                        FontWeight.w400,
                                        fontBuilder:
                                            GoogleFonts.cormorantInfant,
                                      )
                                      .copyWith(
                                          color: AppStyle.primaryGray90998B),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 64),
                                    Text(
                                      'Bảo Hân',
                                      style: KSTheme.of(context)
                                          .style
                                          .ts70w500
                                          .copyWith(
                                              color: Colors.black, height: 1.0),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Chuyện tình của chúng mình...\nsắp bước sang một trang mới',
                                  textAlign: TextAlign.right,
                                  style: KSTextStyle().style(
                                    18,
                                    FontWeight.w400,
                                    fontBuilder: GoogleFonts.cormorantInfant,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    // Spacer(),


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
                              ],
                            ),
                          ),
                        ),
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
                      targetHeight: 750,
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
                                        child: Row(
                                          children: [
                                            KSText(
                                              "Thông tin liên lạc",
                                              style: KSTheme.of(context)
                                                  .style
                                                  .ts42w500
                                                  .copyWith(
                                                      color: AppStyle.whiteBg),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppStyle.whiteBg,
                                            )
                                          ],
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
                                        child: Row(
                                          children: [
                                            KSText(
                                              "Khoảnh khắc tình yêu",
                                              style: KSTheme.of(context)
                                                  .style
                                                  .ts42w500
                                                  .copyWith(
                                                      color: AppStyle.whiteBg),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppStyle.whiteBg,
                                            )
                                          ],
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
                                        child: Row(
                                          children: [
                                            KSText(
                                              "Lịch trình sự kiện",
                                              style: KSTheme.of(context)
                                                  .style
                                                  .ts42w500
                                                  .copyWith(
                                                      color: AppStyle.whiteBg),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppStyle.whiteBg,
                                            )
                                          ],
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
                                        child: Row(
                                          children: [
                                            KSText(
                                              "Bạn có đến không nè? ",
                                              style: KSTheme.of(context)
                                                  .style
                                                  .ts42w500
                                                  .copyWith(
                                                      color: AppStyle.whiteBg),
                                            ),
                                            KSText(
                                              "( Gửi xác nhận )",
                                              style: KSTheme.of(context)
                                                  .style
                                                  .ts42w500
                                                  .copyWith(
                                                      color: AppStyle
                                                          .primaryGreen617856),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppStyle.whiteBg,
                                            )
                                          ],
                                        ),
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
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              //                   <--- border color
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: AppStyle.padding_all_8(),
                            child: SvgPicture.asset(
                              Assets.svg.svgArrowDown.keyName,
                              width: 35,
                            ),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Xem ngay',
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
            ],
          ),
          Transform.translate(
            offset: Offset(0, -1),
            child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 128,
                      ),
                      KSText("Đếm ngược tới ngày cưới",
                          style: KSTheme.of(context)
                              .style
                              .ts70w500
                              .copyWith(color: AppStyle.whiteBg)),
                      KSText(
                        'Hân hoan thông báo lễ thành hôn của chúng mình! Rất mong bạn ',
                        style: KSTextStyle()
                            .style(
                              18,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.cormorantInfant,
                            )
                            .copyWith(color: AppStyle.primaryGray90998B),
                      ),
                      KSText(
                        textAlign: TextAlign.center,
                        'sẽ đến chung vui vào ngày trọng đại.hời gian đang đếm ngược đến khoảnh khắc thiêng liêng nhất của tụi mình. Đừng bỏ lỡ nhé!',
                        style: KSTextStyle()
                            .style(
                              18,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.cormorantInfant,
                            )
                            .copyWith(color: AppStyle.primaryGray90998B),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeColumn(
                        topLeft: vm.dayTens.toString(),
                        topRight: vm.dayUnits.toString(),
                        label: 'Ngày',
                      ),
                      const SizedBox(width: 32),
                      TimeColumn(
                        topLeft: vm.hourTens.toString(),
                        topRight: vm.hourUnits.toString(),
                        label: 'Giờ',
                      ),
                      const SizedBox(width: 32),
                      TimeColumn(
                        topLeft: vm.minuteTens.toString(),
                        topRight: vm.minuteUnits.toString(),
                        label: 'Phút',
                      ),
                    ],
                  ),
                  Container(
                    key: vm.infoKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 128,
                        ),
                        KSText("Kết duyên trăm năm",
                            style: KSTheme.of(context)
                                .style
                                .ts70w500
                                .copyWith(color: AppStyle.whiteBg)),
                        KSText(
                          textAlign: TextAlign.center,
                          'Hai con người, một hành trình. Tụi mình đã tìm thấy nhau \nvà giờ đây sẵn sàng bước vào một chương mới – hôn nhân.',
                          style: KSTextStyle()
                              .style(
                                18,
                                FontWeight.w400,
                                fontBuilder: GoogleFonts.cormorantInfant,
                              )
                              .copyWith(color: AppStyle.primaryGray90998B),
                        ),
                      ],
                    ),
                  ),
                  CrossScrollDrivenAnimation(
                    onScrollLockChanged: vm.setScrollLock,
                    scrollController: vm.scrollController,
                    leftBoxWidth: 0.5 * width,
                    leftBoxHeight: 500,
                    rightBoxWidth: 0.5 * width,
                    rightBoxHeight: 500,
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
                    height: 128 + 128 + 128,
                    child: Stack(
                      children: vm.bubbles.map((bubble) {
                        return FlyingChatBubble(
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
                          height: 128,
                        ),
                        Column(
                          children: [
                            KSText("Lời chúc từ những người thương yêu",
                                textAlign: TextAlign.center,
                                style: KSTheme.of(context)
                                    .style
                                    .ts70w500
                                    .copyWith(
                                        color: AppStyle.primaryColorBlack)),
                            SizedBox(
                              height: 16,
                            ),
                            KSText(
                              textAlign: TextAlign.center,
                              'Mỗi lời chúc là một món quà tinh thần quý giá mà tụi mình sẽ luôn ghi nhớ.',
                              style: KSTextStyle()
                                  .style(
                                    18,
                                    FontWeight.w400,
                                    fontBuilder: GoogleFonts.cormorantInfant,
                                  )
                                  .copyWith(color: AppStyle.primaryColorBlack),
                            ),
                            KSText(
                              textAlign: TextAlign.center,
                              'Cảm ơn vì đã gửi đến tụi mình những tình cảm chân thành và ngọt ngào nhất trong ngày đặc biệt này.',
                              style: KSTextStyle()
                                  .style(
                                    18,
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
                        Container(
                          width: 0.7 * width,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      KSText("Ai đang gửi yêu thương vậy nè?",
                                          style: KSTextStyle()
                                              .style(
                                                23,
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
                                        controller: vm.usernameController,
                                        onTap: (){
                                          EmojiPopupController().hide();
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              "Vd: Cô Út, Chú 6, Bảo Bảo nè,...",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      KSText(
                                          "Ghi lời chúc hoặc một mẩu chuyện bạn nhớ về tụi mình cũng được nè!",
                                          style: KSTextStyle()
                                              .style(
                                                23,
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
                                      EmojiTextField(onChanged: (String x){

                                        vm.cmtContoller.text = x;
                                      },),
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
                                            "Gửi ngay",
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
                        KSText("Khoảnh khắc tình yêu",
                            style: KSTheme.of(context)
                                .style
                                .ts70w500
                                .copyWith(color: AppStyle.whiteBg)),
                        KSText(
                          textAlign: TextAlign.center,
                          'Mời bạn cùng ngắm nhìn những thước ảnh ghi lại hành trình yêu thương của tụi mình.',
                          style: KSTextStyle()
                              .style(
                                18,
                                FontWeight.w400,
                                fontBuilder: GoogleFonts.cormorantInfant,
                              )
                              .copyWith(color: AppStyle.whiteBg),
                        ),
                        SizedBox(
                          height: 64,
                        ),
                        GroupedFocusCarousel(
                          onTap: (int index) async {
                            await vm.findImg(index, context);
                            EmojiPopupController().hide();
                            showMessagePopup(
                              context,
                              vm,
                            );
                          },
                          imagePaths: vm.listImg.map((e) => e.url).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    KSText("Lịch trình sự kiện",
                        style: KSTheme.of(context)
                            .style
                            .ts70w500
                            .copyWith(color: AppStyle.primaryColorBlack)),
                    SizedBox(
                      height: 16,
                    ),
                    KSText(
                      textAlign: TextAlign.center,
                      'Cùng xem các mốc quan trọng trong lễ cưới – từ lễ đón dâu, lễ nhà thờ đến tiệc cưới tại nhà hàng.',
                      style: KSTextStyle()
                          .style(
                            18,
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
          Padding(
            padding: AppStyle.padding_LR_16().copyWith(left: 64, right: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TimelineIndicator(
                      isLast: true,
                      lineBottomHeight: 217,
                    ),
                    TimelineItemWidget(
                      title: "Hôn Phối",
                      date: "17h00 Ngày 11/07/2025",
                      location: "15 Đ. Trần Phú, Phường 3, Đà Lạt",
                      description:
                          "Nghi thức thiêng liêng dưới sự chứng giám của Chúa.",
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
                      lineTopHeight: 108,
                      lineBottomHeight: 109,
                    ),
                    TimelineItemWidget(
                      title: "Lễ Rước Dâu",
                      date: "08h00 Ngày 14/07/2025",
                      location: "10 Ngô Thi Sỹ - P4, Tp Đà Lạt",
                      description:
                          "Gặp gỡ hai gia đình & chính thức rước nàng về dinh.",
                      imagePath: Assets.png.pngAddress2.keyName,
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
                      lineTopHeight: 217,
                    ),
                    TimelineItemWidget(
                      title: "Lễ Cưới Nhà Hàng",
                      date: "11h30 Ngày 14/07/2025",
                      location: "19 Nguyễn Du, Phường 9, Đà Lạt",
                      description: "Bữa tiệc ấm áp bên bạn bè và người thân.",
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
          ),
          SizedBox(
            height: 64,
          )
        ],
      );
    });
  }
  Widget _buildLottieButton({required Key key, required bool hovered,  required HomeScreenVm vm}) {
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
  Widget _buildPlayButton({required Key key, required bool hovered , required HomeScreenVm vm}) {
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

  // auto expand input field sau khi mở
  // Future.delayed(Duration(milliseconds: 300), () {
  //   // vm.setExpandedCMT(true);
  // });


}
