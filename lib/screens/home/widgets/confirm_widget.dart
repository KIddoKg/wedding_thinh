part of '../home_screen.dart';

class _ConfirmWidget extends StatefulWidget {
  const _ConfirmWidget({super.key});

  @override
  State<_ConfirmWidget> createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<_ConfirmWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = SizeConfig.screenWidth!;
    final height = SizeConfig.screenHeight!;

    return Consumer<HomeScreenVm>(builder: (context, vm, child) {
      return Column(
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppStyle.primaryGreen11150F,
                  AppStyle.primaryGreen11150F,
                  AppStyle.primaryGreen647B58,
                ],
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 16 / 9, // hoặc 2 / 3
                            child: Stack(
                              children: [
                                // Ảnh nền toàn khung
                                Positioned.fill(
                                  child: Image.asset(
                                    Assets.png.pngConfirm.keyName,
                                    // thay bằng ảnh của bạn
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // Khung trắng viền mỏng bên phải
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 0.2 * width,
                        )
                      ],
                    ),
                    Positioned(
                      right:0.1 * width,
                      top: 0,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          // margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            border: Border.all(color: Colors.black45),
                          ),
                          child: Container(
                            // height: ,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black45),
                            ),
                            child: Padding(
                              padding: AppStyle.padding_all_16()
                                  .copyWith(left: 32, right: 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Icon nhánh cây nhỏ (vector/svg nếu cần)
                                  // SvgPicture.asset(Assets.svg.svgFlower.keyName),
                                  Image.asset(
                                    Assets.png.pngFlower.keyName,
                                    width: 35,
                                  ),
                                  const SizedBox(height: 12),

                                  // Text "Bạn sẽ đến chứ?"
                                  AutoSizeText(
                                    minFontSize: 10,
                                    S.current.will_you_come,
                                    textAlign: TextAlign.center,
                                    // maxLines: 1,

                                    style: KSTextStyle()
                                        .style(
                                      25.sp,
                                      FontWeight.w400,
                                      fontBuilder: GoogleFonts.imperialScript,
                                    ).copyWith(
                                          height:
                                              1.1, // 👈 chỉnh line-height nhỏ lại (default là 1.2–1.5)
                                        ),
                                  ),

                                  Container(
                                    height: 9.w,
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  key: vm.goKey,
                  width: 0.6 * width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center
                    ,
                    children: [
                      SizedBox(
                        height: 64,
                      ),
                      KSText( S.current.will_you_attend,
                          textAlign: TextAlign.center,
                          style: KSTheme.of(context)
                              .style
                              .ts70w500
                              .copyWith(color: AppStyle.whiteBg)),
                      KSText(
                        S.current.line_six,
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
                        S.current.line_six_edd,
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
                SizedBox(height: 32,),
                Container(
                  width: 0.6 * width,
                  child: Center(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KSText(S.current.know_name,
                                style: KSTextStyle()
                                    .style(
                                  23,
                                  FontWeight.w400,
                                  fontBuilder: GoogleFonts.cormorantInfant,
                                )
                                    .copyWith(
                                        color: AppStyle.primaryGrayB8C1B2)),
                            SizedBox(height: 8,),
                            TextField(
                              onTap: (){
                                EmojiPopupController().hide();
                              },
                              controller: vm.nameController,
                              decoration: InputDecoration(
                                hintText: S.current.ex_who_sending_love,
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  // 👈 Bo tròn
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.black87, width: 1.5),
                                ),
                              ),
                              style: KSTextStyle()
                                  .style(
                                    15,
                                    FontWeight.w400,
                                    fontBuilder: GoogleFonts.cormorantInfant,
                                  )
                                  .copyWith(color: AppStyle.primaryGray8D8D8D),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KSText(S.current.will_you_come_st,
                                style: KSTextStyle()
                                    .style(
                                  23,
                                  FontWeight.w400,
                                  fontBuilder: GoogleFonts.cormorantInfant,
                                )
                                    .copyWith(
                                    color: AppStyle.primaryGrayB8C1B2)),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:   [
                                Expanded(
                                  child: AttendanceCheckbox(
                                    label: S.current.attend,
                                    value: vm.selectedOption == 'attend',
                                    onChanged: (bool checked) {
                                      print("${checked}");

                                       vm.selectedOption = checked ? 'attend' : null;

                                    },
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: AttendanceCheckbox(
                                    label: S.current.no_attend,
                                    value: vm.selectedOption == 'not_attend',
                                    onChanged: (bool checked) {

                                        vm.selectedOption = checked ? 'not_attend' : null;

                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KSText(S.current.many_people,
                                style: KSTextStyle()
                                    .style(
                                  23,
                                  FontWeight.w400,
                                  fontBuilder: GoogleFonts.cormorantInfant,
                                )
                                    .copyWith(
                                    color: AppStyle.primaryGrayB8C1B2)),
                            SizedBox(height: 8,),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onTap: (){
                                EmojiPopupController().hide();
                              },
                              controller: vm.numberController,
                              decoration: InputDecoration(

                                hintText: "Vd: 1",
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  // 👈 Bo tròn
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.black87, width: 1.5),
                                ),
                              ),
                              style: KSTextStyle()
                                  .style(
                                15,
                                FontWeight.w400,
                                fontBuilder: GoogleFonts.cormorantInfant,
                              )
                                  .copyWith(color: AppStyle.primaryGray8D8D8D),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KSText(S.current.to_say,
                                style: KSTextStyle()
                                    .style(
                                  23,
                                  FontWeight.w400,
                                  fontBuilder: GoogleFonts.cormorantInfant,
                                )
                                    .copyWith(
                                    color: AppStyle.primaryGrayB8C1B2)),
                            SizedBox(height: 8,),
                            EmojiTextField(onChanged: (String x){

                              vm.noteContoller.text = x;
                            },),

                            SizedBox(
                              height: 64,
                            ),
                            MouseRegion(
                              hitTestBehavior: HitTestBehavior.translucent,
                              onEnter: (_) => vm.setHover(true),
                              onExit: (_) => vm.setHover(false),
                              child:    AnimatedScale(
                                duration: const Duration(milliseconds: 200),
                                scale:  vm.isHover ? 1.1 : 1.0,
                                child:  Container(


                                    width: 150,
                                    height: 50,
                                    child: KSButton(
                                      onTap: (){
                                        EmojiPopupController().hide();
                                        vm.postInvitation(context);
                                      },
                                        S.current.send_now,
                                      fontSize: 23,
                                      backgroundColor: AppStyle.primaryColorBlack,

                                    ))
                              ),

                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
