part of '../home_mobile_screen.dart';

class _FooterWidget extends StatefulWidget {
  const _FooterWidget({super.key});

  @override
  State<_FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<_FooterWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = SizeConfig.screenWidth!;
    final height = SizeConfig.screenHeight!;

    return Consumer<HomeScreenMobileVm>(builder: (context, vm, child) {
      return Stack(
        children: [
          Column(
            children: [
             Container(

               color: AppStyle.primaryGreen617855,
               child: Padding(
                 padding: AppStyle.padding_all_16().copyWith(top: 32,left: 32,right: 32,bottom: 32),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Image.asset(Assets.png.pngNewLogo.keyName,width: 150,),SizedBox(height:32),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         KSText(    S.current.name,
                             textAlign: TextAlign.center,
                             style: KSTheme.of(context)
                                 .style
                                 .ts28w400
                                 .copyWith(color: AppStyle.whiteBg)),
                         SizedBox(height: 8,),
                         KSText(
                           '${S.current.restauration_name} \n ${S.current.restauration_name_break}',
                           style: KSTextStyle()
                               .style(
                             16,
                             FontWeight.w400,
                             fontBuilder: GoogleFonts.cormorantInfant,
                           )
                               .copyWith(color: AppStyle.whiteBg),
                         ),
                         KSText(
                           // textAlign: TextAlign.center,
                           S.current.item_three_address,
                           style: KSTextStyle()
                               .style(
                             16,
                             FontWeight.w400,
                             fontBuilder: GoogleFonts.cormorantInfant,
                           )
                               .copyWith(color: AppStyle.whiteBg),
                         ),
                         Row(
                           children: [
                             SvgPicture.asset(Assets.svg.svgPhone.keyName,width: 15,),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Image.asset(Assets.png.pngZalo.keyName,width: 15,),
                             ),
                             SvgPicture.asset(Assets.svg.svgFace.keyName,width: 15,)
                           ],
                         )
                       ],
                     ),
                   ],
                 ),
               ),
             )

            ],
          ),
          Positioned(
            top: 32,
            right: 16,

            child:      KSInkWellUnFocus(
            radius: 180,
            onTap: (){
              EmojiPopupController().hide();
              vm.scrollToTop();
            },
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,

                      width: 1.0,
                    )
                ),
                child: Padding(
                    padding: AppStyle.padding_all_16(),
                    child:Icon(Icons.arrow_upward_outlined,size: 15,color: AppStyle.whiteBg,)
                )),
          ),)
        ],
      );
    });
  }
}
