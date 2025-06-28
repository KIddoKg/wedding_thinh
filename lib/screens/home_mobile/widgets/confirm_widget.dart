part of '../home_mobile_screen.dart';

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
            child: Padding(
              padding: AppStyle.padding_all_16(),
              child: Column(
                children: [
                  SizedBox(height: 32,),
                  Align(
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
                                "Bạn sẽ\nđến chứ?",
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
                                child: Image.asset(
                                  Assets.png.pngConfirm.keyName,
                                  // thay bằng ảnh của bạn
                                  fit: BoxFit.cover,
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    key: vm.goKey,
                    width:  width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center
                      ,
                      children: [
                        SizedBox(
                          height: 64,
                        ),
                        KSText("Sự hiện diện của bạn là món quà quý giá",
                            textAlign: TextAlign.center,
                            style: KSTheme.of(context)
                                .style
                                .ts60w500
                                .copyWith(color: AppStyle.whiteBg)),
                        KSText(
                          textAlign: TextAlign.center,
                          'Hạnh phúc của tụi mình sẽ trọn vẹn hơn nếu có bạn bên cạnh. Bạn vui lòng cho tụi mình biết liệu bạn có thể đến chung vui không nhé!',
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
                    width:  width,
                    child: Center(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              KSText("Họ và Tên",
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
                                controller: vm.nameController,
                                decoration: InputDecoration(
                                  hintText: "Họ và Tên",
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
                              KSText("Bạn sẽ đi cùng bao nhiêu người?",
                                  style: KSTextStyle()
                                      .style(
                                    23,
                                    FontWeight.w400,
                                    fontBuilder: GoogleFonts.cormorantInfant,
                                  )
                                      .copyWith(
                                      color: AppStyle.primaryGrayB8C1B2)),
                              SizedBox(height: 8,),
                              DropdownButtonFormField<String>(
                                value: vm.selected,
                                hint: Text(
                                  "Vd: 1",
                                  style: KSTextStyle()
                                      .style(
                                        15,
                                        FontWeight.w400,
                                        fontBuilder: GoogleFonts.cormorantInfant,
                                      )
                                      .copyWith(
                                          color: AppStyle.primaryGray8D8D8D),
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                items: vm.contentMap.keys.map((title) {
                                  return DropdownMenuItem<String>(
                                    value: title,
                                    child: Text(
                                      title,
                                      style: KSTextStyle()
                                          .style(
                                            13,
                                            FontWeight.w400,
                                            fontBuilder:
                                                GoogleFonts.cormorantInfant,
                                          )
                                          .copyWith(
                                              color: AppStyle.primaryGray8D8D8D),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  vm.selected = value;
                                },
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
                              KSText("Gửi gắm điều muốn nói ?",
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
                                controller: vm.noteContoller,
                                minLines: 5,
                                maxLines: 7,
                                decoration: InputDecoration(
                                  hintText: "Nhập lời chúc của bạn",
                                  filled: true,
                                  hintStyle: KSTextStyle()
                                      .style(
                                        15,
                                        FontWeight.w400,
                                        fontBuilder: GoogleFonts.cormorantInfant,
                                      )
                                      .copyWith(
                                          color: AppStyle.primaryGray8D8D8D),
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide.none, // 👈 không có viền
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
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
                              SizedBox(
                                height: 64,
                              ),
                              Container(


                                  width: 100,
                                  height: 35,
                                  child: KSButton(
                                    onTap: (){

                                      vm.postInvitation(context);
                                    },
                                    "Gửi ngay",
                                    backgroundColor: AppStyle.primaryColorBlack,

                                  ))
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
          ),
        ],
      );
    });
  }
}
