part of '../home_screen.dart';

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

    return Consumer<HomeScreenVm>(builder: (context, vm, child) {
      return Column(
        children: [
         Container(

           color: AppStyle.primaryGreen617855,
           child: Padding(
             padding: AppStyle.padding_all_16().copyWith(top: 32,left: 32,right: 32,bottom: 32),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Image.asset(Assets.png.pngNewLogo.keyName,width: 150,),
                 SizedBox(width: 32,),

                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     KSText("Gia Thịnh & Bảo Hân",
                         textAlign: TextAlign.center,
                         style: KSTheme.of(context)
                             .style
                             .ts28w400
                             .copyWith(color: AppStyle.whiteBg)),
                     SizedBox(height: 8,),
                     KSText(
                       'Khách sạn Túi Ba Gang ( Sảnh La’ Muse )',
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
                       '19 Nguyễn Du, Phường 9, Thành phố Đà Lạt.',
                       style: KSTextStyle()
                           .style(
                         15,
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

                Spacer(),
                 KSInkWellUnFocus(
                   radius: 180,
                   onTap: (){
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
                 ),
               ],
             ),
           ),
         )

        ],
      );
    });
  }
}
