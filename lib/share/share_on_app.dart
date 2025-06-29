import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wedding_hkn/screens/home/viewModel/home_screen_vm.dart';
import 'package:wedding_hkn/share/size_configs.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_hkn/share/text_style.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'app_imports.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' as foundation;

class KSIconTextButton extends StatelessWidget {
  final String iconAsset;
  final String text;
  final VoidCallback onTap;
  final double radius;
  final TextStyle? textStyle;
  final double? iconHeight;
  final Widget? imgIcon;

  const KSIconTextButton({
    super.key,
    required this.iconAsset,
    required this.text,
    required this.onTap,
    this.radius = 24,
    this.textStyle,
    this.iconHeight,
    this.imgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return KSInkWellUnFocus(
      radius: radius,
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            iconAsset,
            height: iconHeight ?? SizeConfig.buttonSize,
          ),
          (imgIcon != null)
              ? imgIcon!
              : KSText(
                  text,
                  style: textStyle ??
                      KSTheme.of(context)
                          .style
                          .ts14w700
                          .copyWith(color: AppStyle.primaryNeutral),
                ),
        ],
      ),
    );
  }
}

class TemperatureContainerWidget extends StatelessWidget {
  final String title;
  final List<String> temperatures;
  final List<String>? temperatureTitles;
  final Widget? imgIcon;
  final Widget? custom;

  const TemperatureContainerWidget({
    super.key,
    required this.title,
    required this.temperatures,
    this.temperatureTitles,
    this.imgIcon,
    this.custom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyle.padding_all_16(),
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppStyle.primaryBlue060C29,
              AppStyle.primaryBlue040C30.withOpacity(0.5),
            ],
            stops: [0.0, 1],
          ),
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(16),
        child: custom != null
            ? custom!
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KSText(
                    title,
                    style: KSTheme.of(context)
                        .style
                        .ts15w500
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(temperatures.length, (index) {
                          final temp = temperatures[index];
                          final tempTitle = temperatureTitles != null &&
                                  index < temperatureTitles!.length
                              ? temperatureTitles![index]
                              : "Nhiệt độ hiện tại";

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              width: 13.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppStyle.primaryBlue060C29,
                                    AppStyle.primaryBlue040C30.withOpacity(0.5),
                                  ],
                                  stops: [0.1, 1],
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  KSText(
                                    maxLines: 1,
                                    tempTitle,
                                    style: KSTheme.of(context)
                                        .style
                                        .ts12w400
                                        .copyWith(
                                            color: AppStyle.primaryGrayA0AEC0),
                                  ),
                                  KSText(
                                    temp,
                                    style: KSTheme.of(context)
                                        .style
                                        .ts16w500
                                        .copyWith(color: AppStyle.whiteBg),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 16),
                      if (imgIcon != null)
                        Expanded(child: Center(child: imgIcon!)),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class TimeColumn extends StatelessWidget {
  final String topLeft;
  final String topRight;
  final String label;
  final double size;
  final double ver;

  const TimeColumn({
    required this.topLeft,
    required this.topRight,
    required this.label,
    this.size = 70,
    this.ver = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // dòng chứa [1][1]
        Row(
          children: [
            TimeBox(value: topLeft, size: size,ver: ver),
            const SizedBox(width: 4),
            TimeBox(value: topRight, size: size,ver: ver),
          ],
        ),
        const SizedBox(height: 16),
        KSText(
          label,
          style: KSTextStyle()
              .style(
                20,
                FontWeight.w500,
                fontBuilder: GoogleFonts.cormorantInfant,
              )
              .copyWith(color: AppStyle.whiteBg),
        ),
      ],
    );
  }
}

class TimeBox extends StatelessWidget {
  final double size;
  final String value;
  final double ver;

  const TimeBox({required this.value, this.size = 70,this.ver = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ver, vertical: 8),
      decoration: BoxDecoration(
        color: AppStyle.primaryGrayLight2,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: AppStyle.padding_LR_8(),
        child: KSText(
          value,
          style: KSTextStyle()
              .style(
            size,
                FontWeight.w600,
                fontBuilder: GoogleFonts.cormorantInfant,
              )
              .copyWith(color: AppStyle.primaryColorBlack),
        ),
      ),
    );
  }
}

class GroupedFocusCarousel extends StatefulWidget {
  final List<String> imagePaths;
  final int itemsPerPage;
  final Duration autoPlayInterval;
  final double focusScale;
  final double normalScale;
  final double focusHeight;
  final double normalHeight;
  final void Function(int index)? onTap;


  const GroupedFocusCarousel({
    super.key,
    required this.imagePaths,
    this.itemsPerPage = 4,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.focusScale = 0.30,
    this.normalScale = 0.14,
    this.focusHeight = 200,
    this.normalHeight = 750,
    this.onTap,
  });

  @override
  State<GroupedFocusCarousel> createState() => _GroupedFocusCarouselState();
}

class _GroupedFocusCarouselState extends State<GroupedFocusCarousel> {
  int currentGroupIndex = 0;
  int currentFocusIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheAllImages();
    });

  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayInterval, (_) => _next());
  }

  void _precacheAllImages() async {
    for (final url in widget.imagePaths) {
      print('📦 Precaching: $url');
      await precacheImage(NetworkImage(url), context);
    }

    print('✅ All images precached!');
  }


  void _next() {

    _resetTimer();
    // _precacheCurrentAndNextGroup();
    setState(() {
      currentFocusIndex++;
      if (currentFocusIndex >= widget.itemsPerPage) {
        currentFocusIndex = 0;
        currentGroupIndex++;
        if ((currentGroupIndex * widget.itemsPerPage) >=
            widget.imagePaths.length) {
          currentGroupIndex = 0;
        }
      }
    });

  }
  void _precacheCurrentAndNextGroup() {
    final nextStart = (currentGroupIndex + 1) * widget.itemsPerPage;
    final nextEnd = (nextStart + widget.itemsPerPage <= widget.imagePaths.length)
        ? nextStart + widget.itemsPerPage
        : widget.imagePaths.length;

    final current = widget.imagePaths.sublist(
      currentGroupIndex * widget.itemsPerPage,
      (currentGroupIndex + 1) * widget.itemsPerPage,
    );

    final next = nextStart < widget.imagePaths.length
        ? widget.imagePaths.sublist(nextStart, nextEnd)
        : [];

    for (final url in {...current, ...next}) {
      precacheImage(NetworkImage(url), context);
    }
  }

  void _prev() {

    _resetTimer();
    // _precacheCurrentAndNextGroup();
    setState(() {
      currentFocusIndex--;
      if (currentFocusIndex < 0) {
        currentGroupIndex--;

        if (currentGroupIndex < 0) {
          currentGroupIndex =
              (widget.imagePaths.length / widget.itemsPerPage).ceil() - 1;
        }

        // 👇 lấy số ảnh của nhóm hiện tại
        final start = currentGroupIndex * widget.itemsPerPage;
        final end = (start + widget.itemsPerPage) <= widget.imagePaths.length
            ? start + widget.itemsPerPage
            : widget.imagePaths.length;
        final groupLength = end - start;

        currentFocusIndex = groupLength - 1;
      }
    });
  }




  void _resetTimer() {
    _timer?.cancel();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final start = currentGroupIndex * widget.itemsPerPage;
    final end = (start + widget.itemsPerPage) <= widget.imagePaths.length
        ? start + widget.itemsPerPage
        : widget.imagePaths.length;
    final currentImages = widget.imagePaths.sublist(start, end);

    return Stack(
      alignment: Alignment.center,
      children: [
        Offstage(
          offstage: true, // 👈 không hiển thị nhưng vẫn build và load
          child: Column(
            children: widget.imagePaths.map((url) {
              return Image.network(url, width: 1, height: 1); // ép tải nhưng nhẹ
            }).toList(),
          ),
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final isForward = true; // bạn có thể thay đổi để phân biệt trái/phải
            final offsetTween = Tween<Offset>(
              begin: Offset(isForward ? 1.0 : -1.0, 0),
              end: Offset.zero,
            );

            return SlideTransition(
              position: offsetTween.animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: child,
            );
          },
          child: Container(

            key: ValueKey(currentGroupIndex), // 👈 Rất quan trọng để Switcher biết khi nào animate
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(currentImages.length, (index) {
                final isFocused = index == currentFocusIndex;
                return GestureDetector(
                  onTap: () {
                    final globalIndex =
                        currentGroupIndex * widget.itemsPerPage + index;
                    widget.onTap?.call(globalIndex);
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black45),
                    ),
                    duration: const Duration(milliseconds: 500),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: isFocused
                        ? screenWidth * widget.focusScale
                        : screenWidth * widget.normalScale,
                    height: widget.normalHeight,
                    child: NetworkImageSmartLoading(url: currentImages[index]),
                  ),
                );

              }),
            ),
          ),
        ),

        Positioned(
          left: 16,
          child: _ArrowButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: (){
              _prev();
              EmojiPopupController().hide();
            },
          ),
        ),
        Positioned(
          right: 16,
          child: _ArrowButton(
            icon: Icons.arrow_forward_ios,
            onPressed: (){
              EmojiPopupController().hide();
              _next();
            },
          ),
        ),
      ],
    );
  }
}






class GroupedFocusCarouselMobile extends StatefulWidget {
  final List<String> imagePaths;
  final Duration autoPlayInterval;
  final double focusScale;
  final double focusHeight;
  final void Function(int index)? onTap;

  const GroupedFocusCarouselMobile({
    super.key,
    required this.imagePaths,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.focusScale = 0.85,
    this.focusHeight = 700,
    this.onTap,
  });

  @override
  State<GroupedFocusCarouselMobile> createState() => _GroupedFocusCarouselMobileState();
}

class _GroupedFocusCarouselMobileState extends State<GroupedFocusCarouselMobile> {
  int currentFocusIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("objectA");
    //
    //   _precacheAllImages();
    // });
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayInterval, (_) => _next());
  }



void _precacheAllImages() async {
    print(widget.imagePaths.length);
  for (final url in widget.imagePaths) {
    print('📦 Precaching: $url');
    await precacheImage(NetworkImage(url), context);
  }

  print('✅ All images precached!');
}


void _resetTimer() {
    _timer?.cancel();
    _startAutoPlay();
  }

  void _next() {
    _resetTimer();
    setState(() {
      currentFocusIndex =
          (currentFocusIndex + 1) % widget.imagePaths.length;
    });
  }

  void _prev() {
    _resetTimer();
    setState(() {
      currentFocusIndex =
          (currentFocusIndex - 1 + widget.imagePaths.length) %
              widget.imagePaths.length;
    });
  }
  // @override
  // void didUpdateWidget(covariant GroupedFocusCarouselMobile oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.imagePaths != widget.imagePaths && widget.imagePaths.isNotEmpty) {
  //     _precacheAllImages();
  //   }
  // }

bool _hasPrecached = false;
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.imagePaths[currentFocusIndex];
    final screenWidth = MediaQuery.of(context).size.width;
    // print(widget.imagePaths);
    if (!_hasPrecached && widget.imagePaths.isNotEmpty) {
      _hasPrecached = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _precacheAllImages();
      });
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: child,
            );
          },
          child: GestureDetector(
            key: ValueKey(currentFocusIndex),
            onTap: () => widget.onTap?.call(currentFocusIndex),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: screenWidth * widget.focusScale,
              height: widget.focusHeight,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: NetworkImageSmartLoading(url: image),
            ),
          ),
        ),

        Positioned(
          left: 16,
          child: _ArrowButtonMobile(
            icon: Icons.arrow_back,

            onPressed: (){
              EmojiPopupController().hide();
              _prev();
            },
          ),
        ),
        Positioned(
          right: 16,
          child: _ArrowButtonMobile(
            icon: Icons.arrow_forward,
            onPressed: (){
              EmojiPopupController().hide();
              _next();
            },
          ),
        ),
      ],
    );
  }
}




class LoadingLottie extends StatelessWidget {
  final double width;
  final double height;

  const LoadingLottie({
    super.key,
    this.width = 200,
    this.height = 200
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Assets.json.jsonLoadingDot,
        width: width,
        height: height,
      ),
    );
  }
}
class NetworkImageSmartLoading extends StatefulWidget {
  final String url;
  final BoxFit fit;

  const NetworkImageSmartLoading({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  });

  @override
  State<NetworkImageSmartLoading> createState() => _NetworkImageSmartLoadingState();
}

class _NetworkImageSmartLoadingState extends State<NetworkImageSmartLoading> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _loadImageSmartly(widget.url);
  }

  Future<void> _loadImageSmartly(String url) async {
    final completer = Completer<void>();
    bool isResolvedInstantly = false;

    final image = NetworkImage(url);
    final stream = image.resolve(const ImageConfiguration());

    final listener = ImageStreamListener(
          (info, _) {
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
      onError: (error, _) {
        if (!completer.isCompleted) {
          completer.complete(); // vẫn tiếp tục để tránh đứng
        }
      },
    );

    stream.addListener(listener);

    // Nếu ảnh chưa sẵn, ép delay 1s
    final stopwatch = Stopwatch()..start();
    await completer.future;
    stopwatch.stop();

    stream.removeListener(listener);

    // final durationLeft = 100 - stopwatch.elapsedMilliseconds;
    // if (durationLeft > 0) {
    //   await Future.delayed(Duration(milliseconds: durationLeft));
    // }

    if (mounted) {
      setState(() => _isReady = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (!_isReady)
          const Center(child: LoadingLottie()),
        if (_isReady)
          Image.network(widget.url, fit: widget.fit),
      ],
    );
  }
}


class TimelineIndicator extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final double lineTopHeight;
  final double lineBottomHeight;

  const TimelineIndicator({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.lineTopHeight = 8,
    this.lineBottomHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          // Đường phía trên
          if (isFirst)
            SizedBox(
              height: lineTopHeight,
              child: VerticalDivider(
                thickness: 2,
                width: 2,
                color: !isFirst
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.3),
              ),
            ),
          // Chấm tròn
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: AppStyle.primaryGray90998B),
            ),
          ),
          // Đường phía dưới
          if (isLast)
            SizedBox(
              height: lineBottomHeight,
              child: VerticalDivider(
                thickness: 2,
                width: 2,
                color: !isLast
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.3),
              ),
            ),
        ],
      ),
    );
  }
}

class TimelinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..strokeWidth = 2;

    final paintDot = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Vẽ đường dọc
    canvas.drawLine(
        Offset(centerX, 0), Offset(centerX, size.height), paintLine);

    // Vẽ chấm tròn ở giữa
    canvas.drawCircle(Offset(centerX, centerY), 8, paintDot);

    // Vẽ viền trắng quanh chấm
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX, centerY), 8, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ArrowButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey[300],
          onTap: onPressed,
          child: SizedBox(
            width: 48,
            height: 48,
            child: Icon(icon, size: 20),
          ),
        ),
      ),
    );
  }
}


class _ArrowButtonMobile extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ArrowButtonMobile({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey[300],
          onTap: onPressed,
          child: SizedBox(
            width: 25,
            height: 25,
            child: Icon(icon, size: 15),
          ),
        ),
      ),
    );
  }
}

class TimelineItemWidget extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;
  final VoidCallback onTap;
  final String imagePath;

  const TimelineItemWidget({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: AppStyle.padding_all_8(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ảnh bên trái
          if(MediaQuery.of(context).size.width > 960)
          IgnorePointer(
            ignoring: MediaQuery.of(context).size.width <= 980, // 👈 nếu đang ẩn, không cho bấm
            child: AnimatedOpacity(
              opacity: MediaQuery.of(context).size.width > 980 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1500),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Container(
                  height: 217,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          )

          ,
          const SizedBox(width: 32),

          // Nội dung bên phải
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KSText(
                title,
                style: KSTheme.of(context).style.ts42w500.copyWith(
                  color: Colors.black,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 20,color:AppStyle.primaryColorBlack ,),
                  const SizedBox(width: 8),
                  KSText(
                    date,
                    style: KSTextStyle()
                        .style(14, FontWeight.w700,
                        fontBuilder: GoogleFonts.cormorantInfant)
                        .copyWith(color: AppStyle.primaryColorBlack),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 20,color:AppStyle.primaryColorBlack ,),
                  const SizedBox(width: 8),
                  KSText(
                    location,
                    style: KSTextStyle()
                        .style(14, FontWeight.w700,
                        fontBuilder: GoogleFonts.cormorantInfant)
                        .copyWith(color: AppStyle.primaryColorBlack),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              KSText(
                description,
                style: KSTextStyle()
                    .style(18, FontWeight.w500,
                    fontBuilder: GoogleFonts.cormorantInfant)
                    .copyWith(color: AppStyle.primaryGreen647B58),
              ),
              const SizedBox(height: 16),

              KSInkWellUnFocus(
                onTap: onTap,
                radius: 24,
                child: Container(
                  decoration: BoxDecoration(
                    border:
                    Border.all(width: 1, color: AppStyle.primaryColorBlack),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding:
                    AppStyle.padding_LR_16().copyWith(top: 8, bottom: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        KSText(
                          "Xem hướng dẫn",
                          style: KSTextStyle()
                              .style(15, FontWeight.w700,
                              fontBuilder: GoogleFonts.cormorantInfant)
                              .copyWith(color: AppStyle.primaryColorBlack),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_forward, size: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class TimelineItemWidgetMobile extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;
  final VoidCallback onTap;
  final String imagePath;

  const TimelineItemWidgetMobile({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: AppStyle.padding_all_8(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ảnh bên trái
          // if(MediaQuery.of(context).size.width > 960)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Container(
                height: 402,
                width: 65.w,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.circular(8),
                ),
              ),
            )

          ,
          const SizedBox(height: 32),

          // Nội dung bên phải
          Container(
            width: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KSText(
                  title,
                  style: KSTheme.of(context).style.ts30w500.copyWith(
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 20, color: AppStyle.primaryColorBlack),
                    KSText(
                      date,
                      style: KSTextStyle()
                          .style(14, FontWeight.w700, fontBuilder: GoogleFonts.cormorantInfant)
                          .copyWith(color: AppStyle.primaryColorBlack),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Icon(Icons.location_on_outlined, size: 20, color: AppStyle.primaryColorBlack),
                    AutoSizeText(
                      minFontSize: 10,
                      location,
                      maxLines: 2,
                      style: KSTextStyle()
                          .style(13, FontWeight.w700, fontBuilder: GoogleFonts.cormorantInfant)
                          .copyWith(color: AppStyle.primaryColorBlack),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return AutoSizeText(
                      description,
                      minFontSize: 10,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: KSTextStyle()
                          .style(15.sp, FontWeight.w500,
                          fontBuilder: GoogleFonts.cormorantInfant)
                          .copyWith(color: AppStyle.primaryGreen647B58),
                    );
                  },
                )
            ,
                const SizedBox(height: 16),
                KSInkWellUnFocus(
                  onTap: onTap,
                  radius: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                      Border.all(width: 1, color: AppStyle.primaryColorBlack),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding:
                      AppStyle.padding_LR_16().copyWith(top: 8, bottom: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          KSText(
                            "Xem hướng dẫn",
                            style: KSTextStyle()
                                .style(15, FontWeight.w700,
                                fontBuilder: GoogleFonts.cormorantInfant)
                                .copyWith(color: AppStyle.primaryColorBlack),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward, size: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class CrossScrollDrivenAnimation extends StatefulWidget {
  final ScrollController scrollController;
  final Widget redBox;
  final Widget leftBox;
  final Widget rightBox;
  final void Function(bool isLocked) onScrollLockChanged;
  final double leftBoxWidth;
  final double leftBoxHeight;
  final double rightBoxWidth;
  final double rightBoxHeight;

  const CrossScrollDrivenAnimation({
    required this.scrollController,
    required this.redBox,
    required this.leftBox,
    required this.rightBox,
    required this.onScrollLockChanged,
    this.leftBoxWidth = 500,
    this.leftBoxHeight = 500,
    this.rightBoxWidth = 500,
    this.rightBoxHeight = 500,
  });

  @override
  State<CrossScrollDrivenAnimation> createState() =>
      _CrossScrollDrivenAnimationState();
}





enum AnimationStatusState { idle, forwarded, reversed }

class _CrossScrollDrivenAnimationState extends State<CrossScrollDrivenAnimation>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _mainController;
  late AnimationController _redBoxController;
  late Animation<double> _redOpacity;

  final GlobalKey _key = GlobalKey();
  AnimationStatusState _state = AnimationStatusState.idle;
  double? _lastScrollOffset;
  bool _redBoxPlayed = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // _mainController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 1500),
    // );
    //
    // _redBoxController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500),
    // );
    //
    // _redOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(parent: _redBoxController, curve: Curves.easeOut),
    // );
    //
    // _mainController.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     _redBoxPlayed = false;
    //   }
    // });

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   widget.scrollController.addListener(_handleScroll);
    // });
  }

  void _handleScroll() {
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final position = box.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.of(context).size.height;
    final centerY = position + box.size.height / 2;
    final screenCenterY = screenHeight / 2;

    // Reset nếu scroll về đầu
    if (widget.scrollController.offset <= 0 &&
        _redBoxController.status == AnimationStatus.completed) {
      _state = AnimationStatusState.idle;
      _redBoxPlayed = false;
      _redBoxController.reset();
      _mainController.reset();
      return;
    }

    if ((centerY - screenCenterY).abs() < 160) {
      final offset = widget.scrollController.offset;

      if (_lastScrollOffset == null) {
        _lastScrollOffset = offset;
        return;
      }

      final delta = offset - _lastScrollOffset!;
      _lastScrollOffset = offset;

      // Scroll xuống
      if (delta > 0 && _state != AnimationStatusState.forwarded) {
        _state = AnimationStatusState.forwarded;
        widget.onScrollLockChanged(true);

        Future<void> start() async {
          if (!_redBoxPlayed) {
            _redBoxPlayed = true;
            _redBoxController.value = 0.0;
            await _redBoxController.forward();
          }
          await _mainController.forward();
          widget.onScrollLockChanged(false);
        }

        start();
      }

      // Scroll lên
      else if (delta < 0 && _state != AnimationStatusState.reversed) {
        _state = AnimationStatusState.reversed;
        widget.onScrollLockChanged(true);
        _mainController.reverse().whenComplete(() {
          widget.onScrollLockChanged(false);
        });
      }
    }
  }

  @override
  void dispose() {
    // widget.scrollController.removeListener(_handleScroll);
    // _mainController.dispose();
    // _redBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final width = MediaQuery.of(context).size.width;
    //
    // final leftTween = Tween<double>(
    //   begin: 0,
    //   end: width - widget.leftBoxWidth,
    // ).animate(_mainController);
    //
    // final rightTween = Tween<double>(
    //   begin: width - widget.rightBoxWidth,
    //   end: 0,
    // ).animate(_mainController);

    return Container(
      key: _key,
      height: 700,
      child: Stack(
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  width: widget.leftBoxWidth,

                  child: Column(
                    children: [
                      Container(
                        width: widget.leftBoxWidth,
                        height: widget.leftBoxHeight,
                        child: widget.leftBox,
                      ),
                      AutoSizeText("Nguyễn Thị Bảo Hân",
                          maxLines: 1,
                          minFontSize: 10,
                          style: KSTextStyle()
                              .style(
                            20.sp,
                            FontWeight.w400,
                            fontBuilder: GoogleFonts.imperialScript,
                          )
                              .copyWith(color: AppStyle.whiteBg)),
                      KSText(
                        textAlign: TextAlign.center,
                        'Út Nữ',
                        style: KSTextStyle()
                            .style(
                              20,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.cormorantInfant,
                            )
                            .copyWith(color: AppStyle.whiteBg),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.rectangle,
                      //             color: AppStyle.whiteBg),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(4.0),
                      //           child: SvgPicture.asset(
                      //             Assets.svg.svgPhone.keyName,
                      //             width: 20,
                      //             color: Colors.black,
                      //           ),
                      //         )),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //           decoration: BoxDecoration(
                      //               shape: BoxShape.rectangle,
                      //               color: AppStyle.whiteBg),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(4.0),
                      //             child: Image.asset(
                      //                 Assets.png.pngZalo.keyName,
                      //                 width: 20,
                      //                 color: Colors.black),
                      //           )),
                      //     ),
                      //     Container(
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.rectangle,
                      //             color: AppStyle.whiteBg),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(4.0),
                      //           child: SvgPicture.asset(
                      //               Assets.svg.svgFace.keyName,
                      //               width: 20,
                      //               color: Colors.black),
                      //         ))
                      //   ],
                      // )
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  width: widget.rightBoxWidth,

                  child: Column(
                    children: [
                      Container(
                        width: widget.rightBoxWidth,
                        height: widget.rightBoxHeight,
                        child: widget.rightBox,
                      ),
                      AutoSizeText("Lê Gia Thịnh",
                          maxLines: 1,
                          minFontSize: 10,
                          style: KSTextStyle()
                              .style(
                            20.sp,
                            FontWeight.w400,
                            fontBuilder: GoogleFonts.imperialScript,
                          )
                              .copyWith(color: AppStyle.whiteBg)),
                      KSText(
                        textAlign: TextAlign.center,
                        'Út Nam',
                        style: KSTextStyle()
                            .style(
                              20,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.cormorantInfant,
                            )
                            .copyWith(color: AppStyle.whiteBg),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.rectangle,
                      //             color: AppStyle.whiteBg),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(4.0),
                      //           child: SvgPicture.asset(
                      //             Assets.svg.svgPhone.keyName,
                      //             width: 20,
                      //             color: Colors.black,
                      //           ),
                      //         )),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //           decoration: BoxDecoration(
                      //               shape: BoxShape.rectangle,
                      //               color: AppStyle.whiteBg),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(4.0),
                      //             child: Image.asset(
                      //                 Assets.png.pngZalo.keyName,
                      //                 width: 20,
                      //                 color: Colors.black),
                      //           )),
                      //     ),
                      //     Container(
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.rectangle,
                      //             color: AppStyle.whiteBg),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(4.0),
                      //           child: SvgPicture.asset(
                      //               Assets.svg.svgFace.keyName,
                      //               width: 20,
                      //               color: Colors.black),
                      //         ))
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // AnimatedBuilder(
          //   animation: _redBoxController,
          //   builder: (_, __) {
          //     final shouldShowRed = !_redBoxPlayed ||
          //         _redBoxController.isAnimating ||
          //         !_redBoxController.isCompleted;
          //
          //     if (!shouldShowRed) return const SizedBox.shrink();
          //
          //     return Opacity(
          //       opacity: _redOpacity.value,
          //       child: Center(child: widget.redBox),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}


class CrossScrollDrivenAnimationMobile extends StatefulWidget {
  final ScrollController scrollController;
  final Widget redBox;
  final Widget leftBox;
  final Widget rightBox;
  final void Function(bool isLocked) onScrollLockChanged;
  final double leftBoxWidth;
  final double leftBoxHeight;
  final double rightBoxWidth;
  final double rightBoxHeight;

  const CrossScrollDrivenAnimationMobile({
    required this.scrollController,
    required this.redBox,
    required this.leftBox,
    required this.rightBox,
    required this.onScrollLockChanged,
    this.leftBoxWidth = 500,
    this.leftBoxHeight = 500,
    this.rightBoxWidth = 500,
    this.rightBoxHeight = 500,
  });

  @override
  State<CrossScrollDrivenAnimationMobile> createState() =>
      _CrossScrollDrivenAnimationMobileState();
}



class _CrossScrollDrivenAnimationMobileState extends State<CrossScrollDrivenAnimationMobile>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _mainController;
  late AnimationController _redBoxController;
  late Animation<double> _redOpacity;

  final GlobalKey _key = GlobalKey();
  AnimationStatusState _state = AnimationStatusState.idle;
  double? _lastScrollOffset;
  bool _redBoxPlayed = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // _mainController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 1500),
    // );
    //
    // _redBoxController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500),
    // );
    //
    // _redOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(parent: _redBoxController, curve: Curves.easeOut),
    // );
    //
    // _mainController.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     _redBoxPlayed = false;
    //   }
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   widget.scrollController.addListener(_handleScroll);
    // });
  }

  void _handleScroll() {
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final position = box.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.of(context).size.height;
    final centerY = position + box.size.height / 2;
    final screenCenterY = screenHeight / 2;

    // Reset nếu scroll về đầu
    if (widget.scrollController.offset <= 0 &&
        _redBoxController.status == AnimationStatus.completed) {
      _state = AnimationStatusState.idle;
      _redBoxPlayed = false;
      _redBoxController.reset();
      _mainController.reset();
      return;
    }

    if ((centerY - screenCenterY).abs() < 160) {
      final offset = widget.scrollController.offset;

      if (_lastScrollOffset == null) {
        _lastScrollOffset = offset;
        return;
      }

      final delta = offset - _lastScrollOffset!;
      _lastScrollOffset = offset;

      // Scroll xuống
      if (delta > 0 && _state != AnimationStatusState.forwarded) {
        _state = AnimationStatusState.forwarded;
        widget.onScrollLockChanged(true);

        Future<void> start() async {
          if (!_redBoxPlayed) {
            _redBoxPlayed = true;
            _redBoxController.value = 0.0;
            await _redBoxController.forward();
          }
          await _mainController.forward();
          widget.onScrollLockChanged(false);
        }

        start();
      }

      // Scroll lên
      else if (delta < 0 && _state != AnimationStatusState.reversed) {
        _state = AnimationStatusState.reversed;
        widget.onScrollLockChanged(true);
        _mainController.reverse().whenComplete(() {
          widget.onScrollLockChanged(false);
        });
      }
    }
  }

  @override
  void dispose() {
    // widget.scrollController.removeListener(_handleScroll);
    // _mainController.dispose();
    // _redBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final width = MediaQuery.of(context).size.width;
    //
    // final leftTween = Tween<double>(
    //   begin: 0,
    //   end: width - widget.leftBoxWidth,
    // ).animate(_mainController);
    //
    // final rightTween = Tween<double>(
    //   begin: width - widget.rightBoxWidth,
    //   end: 0,
    // ).animate(_mainController);

    return NotificationListener<ScrollNotification>(
      onNotification: (_) => true,
      child: Container(
        key: _key,
        // color: AppStyle.greyBg,
        height: 480,
            // MediaQuery.of(context).size.height * 0.2,
        child: Stack(
          children: [

            Container(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 20,
                    width: widget.leftBoxWidth,
                    // height: widget.leftBoxHeight +
                    //     128+32,
                    child: Column(
                      children: [
                        Container(
                          width: widget.leftBoxWidth,
                          // height: widget.leftBoxHeight,
                          child: widget.leftBox,
                        ),
                        SizedBox(height: 32,),
                        AutoSizeText("Nguyễn Thị \nBảo Hân",
                            maxLines: 2,
                            minFontSize: 10,
                            style: KSTextStyle()
                                .style(
                              20.sp,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.imperialScript,
                            )
                                .copyWith(color: AppStyle.whiteBg)),
                        KSText(
                          textAlign: TextAlign.center,
                          'Út Nữ',
                          style: KSTextStyle()
                              .style(
                            20,
                            FontWeight.w400,
                            fontBuilder: GoogleFonts.cormorantInfant,
                          )
                              .copyWith(color: AppStyle.whiteBg),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 20,
                    width: widget.rightBoxWidth,
                    // height: widget.rightBoxHeight +
                    //     128+32,
                    child: Column(
                      children: [
                        Container(
                          width: widget.rightBoxWidth,
                          // height: widget.rightBoxHeight,
                          child: widget.rightBox,
                        ),
                        SizedBox(height: 32,),
                        AutoSizeText("Lê Gia \nThịnh",
                            maxLines: 2,
                            minFontSize: 10,
                            style: KSTextStyle()
                                .style(
                              20.sp,
                              FontWeight.w400,
                              fontBuilder: GoogleFonts.imperialScript,
                            )
                                .copyWith(color: AppStyle.whiteBg)),
                        KSText(
                          textAlign: TextAlign.center,
                          'Út Nam',
                          style: KSTextStyle()
                              .style(
                            20,
                            FontWeight.w400,
                            fontBuilder: GoogleFonts.cormorantInfant,
                          )
                              .copyWith(color: AppStyle.whiteBg),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            // AnimatedBuilder(
            //   animation: _redBoxController,
            //   builder: (_, __) {
            //     final shouldShowRed = !_redBoxPlayed ||
            //         _redBoxController.isAnimating ||
            //         !_redBoxController.isCompleted;
            //
            //     if (!shouldShowRed) return const SizedBox.shrink();
            //
            //     return Opacity(
            //       opacity: _redOpacity.value,
            //       child: Center(child: widget.redBox),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}


class ExpandableRevealPanel extends StatefulWidget {
  final Widget content;
  final String blackLottieAsset;
  final String whiteLottieAsset;
  final double targetHeight;
  final Duration duration;
  final void Function()? onCollapseRequested;

  const ExpandableRevealPanel({
    super.key,
    required this.content,
    required this.blackLottieAsset,
    required this.whiteLottieAsset,
    this.onCollapseRequested,
    this.targetHeight = 400,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<ExpandableRevealPanel> createState() => ExpandableRevealPanelState();
}

class ExpandableRevealPanelState extends State<ExpandableRevealPanel>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  double _radius = 30;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
      _radius = isExpanded ? 0 : 30;

      // Future.delayed(Duration(milliseconds: 1000));

    });

    if (isExpanded) {
      _controller.forward(from: 0);
    } else {
      _controller.reverse();
      widget.onCollapseRequested?.call();
    }
  }

  void collapse() {
    print("object");
    if (isExpanded) {
      _toggleExpand();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final height = widget.targetHeight;

    return Stack(
      children: [
        // Background container expanding
        AnimatedPositioned(
          duration: widget.duration,
          curve: Curves.easeInOut,
          top: 0,
          right: 0,
          child: AnimatedContainer(
            duration: widget.duration,
            curve: Curves.easeInOut,
            width: isExpanded ? screenWidth : 60,
            height: isExpanded ? height : 60,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(_radius),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isExpanded ? Color(0xFF647B58) : Colors.transparent,
                  // AppStyle.primaryGreen647B58
                  isExpanded ? Color(0xFF11150F) : Colors.transparent,
                  // AppStyle.primaryGreen11150F
                ],
              ),
            ),
          ),
        ),

        // Content shown after expand
        AnimatedPositioned(
          duration: widget.duration,
          top: 0,
          right: 0,
          child: IgnorePointer(
            ignoring: !isExpanded,
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: isExpanded ? 1500 : 300), // Vào chậm, ra nhanh
              tween: Tween<double>(begin: isExpanded ? 0 : 1, end: isExpanded ? 1 : 0),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: SizedBox(
                width: screenWidth,
                height: height,
                child: widget.content,
              ),
            ),
          ),
        )
,

        // Lottie button with fade between black and white animation
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: _toggleExpand,
            child: SizedBox(
              width: 60,
              height: 60,
              child: Stack(
                children: [
                  // Black base icon

                  // White overlay icon with animated opacity
                  // AnimatedOpacity(
                  //   duration: widget.duration,
                  //   opacity: isExpanded ? 1 : 0,
                  //   child: Lottie.asset(
                  //     widget.whiteLottieAsset,
                  //     controller: _controller,
                  //     repeat: false,
                  //   ),
                  // ),
                  Lottie.asset(
                    widget.whiteLottieAsset,
                    controller: _controller,
                    repeat: true,
                    onLoaded: (comp) {
                      _controller.duration = comp.duration;
                    },
                  ),
                  AnimatedOpacity(
                    opacity: (!isExpanded) ? 1.0 : 0.0,
                    duration: Duration(
                      milliseconds:
                          (!isExpanded) ? 1200 : 100, // hiện ra chậm, ẩn nhanh
                    ),
                    curve: (!isExpanded) ? Curves.easeIn : Curves.fastOutSlowIn,
                    child: Lottie.asset(
                      widget.blackLottieAsset,
                      repeat: false,
                      animate: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatBubbleData {
  final String name;
  final String time;
  final String message;
  final double left;

  ChatBubbleData({
    required this.name,
    required this.time,
    required this.message,
    required this.left,
  });
}

class FlyingChatBubble extends StatefulWidget {
  final ChatBubbleData data;
  final VoidCallback? onCompleted;

  const FlyingChatBubble({
    super.key,
    required this.data,
    this.onCompleted,
  });

  @override
  State<FlyingChatBubble> createState() => _FlyingChatBubbleState();
}

class _FlyingChatBubbleState extends State<FlyingChatBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _positionAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _positionAnimation = Tween<double>(begin: 0, end: 300).animate(_controller);
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          bottom: _positionAnimation.value,
          left: widget.data.left,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: child,
          ),
        );
      },
      child: _bubbleContent(),
    );
  }

  Widget _bubbleContent() {
    final data = widget.data;
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${data.name} ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextSpan(
                  text: data.time,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.message,
            style: TextStyle(
              fontFamily: GoogleFonts.cormorantInfant().fontFamily, // hoặc GoogleFonts.roboto().fontFamily
              fontFamilyFallback: ['NotoColorEmoji'],
              fontSize: 16,
              color: Colors.black87,
            ),
          )

        ],
      ),
    );
  }
}



class MessagePopupDialog extends StatelessWidget {
  const MessagePopupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeScreenVm>(context);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 778 + 64,
        width: 518 + 518,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppStyle.primaryGreenCAD1C6, AppStyle.whiteBg],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: vm.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        /// Ảnh cưới bên trái
                        Expanded(
                          flex:2,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  vm.linkUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return LoadingLottie();
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(child: Icon(Icons.broken_image, size: 40));
                                  },
                                ),
                              ),

                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: IconButton(
                                      icon: const Icon(Icons.close, color: Colors.black, size: 15),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // vm.removeImage(); // hoặc callback tùy bạn
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),

                        /// Input + danh sách lời nhắn
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.only(bottom: 16), // optional
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildCommentSection(context, vm),
                                      const SizedBox(height: 16),
                                      _buildMessageList(vm),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                  _buildFooter(vm, context)
                ],
              ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, HomeScreenVm vm) {


    return InkWell(
      onTap: (){

      },
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              onTap: (){
                vm.setExpandedCMT(true);
              },
              // controller: vm.controllerCMT,
              decoration: InputDecoration(
                hintText: 'Để lại lời nhắn...',
                hintStyle: KSTextStyle()
                    .style(
                      18,
                      FontWeight.w700,
                      fontBuilder: GoogleFonts.cormorantInfant,
                    )
                    .copyWith(
                      color:
                          AppStyle.primaryGreen647B58, // Nếu khóa thì đổi màu chữ
                    ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      print("bấm");
                      vm.setExpandedCMT(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle.primaryGreen617855,
                    ),
                    child: Text(
                      "Gửi ngay",
                      style: KSTextStyle()
                          .style(
                            18,
                            FontWeight.w700,
                            fontBuilder: GoogleFonts.cormorantInfant,
                          )
                          .copyWith(
                            color: AppStyle.whiteBg, // Nếu khóa thì đổi màu chữ
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(HomeScreenVm vm) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: vm.messages.length + 1, // thêm 1 item ở cuối
      itemBuilder: (context, index) {
        if (index == vm.messages.length) {
          if (!vm.hasMoreComments) return const SizedBox.shrink();

          final remaining = vm.totalComments - vm.messages.length;
          final toLoad = remaining >= 5 ? 5 : remaining;

          return vm.isLoadingMoreCMT
              ? LoadingLottie(height: 100,)
              : GestureDetector(
            onTap: () => vm.next10CMT(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // Gạch chân tự định nghĩa
                  Container(
                    height: 1,
                    width: 170, // 👉 chỉnh chiều dài gạch chân ở đây
                    color: Colors.black,
                  ),
                  // Nội dung chữ
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2), // 👉 khoảng cách giữa text và line
                    child: Text(
                      'Xem thêm $toLoad lời nhắn khác',
                      style: KSTextStyle()
                          .style(
                        15,
                        FontWeight.w700,
                        fontBuilder: GoogleFonts.cormorantInfant,
                      )
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),

            ),
          );
        }


        final msg = vm.messages[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg.userName,
                style: KSTextStyle()
                    .style(
                  14,
                  FontWeight.w700,
                  fontBuilder: GoogleFonts.cormorantInfant,
                )
                    .copyWith(
                  color: AppStyle.primaryColorBlack,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                msg.comment,
                style: KSTextStyle()
                    .style(
                  13,
                  FontWeight.w400,
                  fontBuilder: GoogleFonts.cormorantInfant,
                )
                    .copyWith(
                  color: AppStyle.primaryColorBlack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }




  Widget _buildFooter(HomeScreenVm vm,  BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(vm.indexList != 0)
          InkWell(
            onTap: () async {
              await loadDataWithLoading(
              action: () async {
                EmojiPopupController().hide();
                vm.preImgCMT(  context,); // ✅ Hàm TestBug được chạy sau khi loading hiển thị xong
              },
              );


            },
            child: KSText(
              "Quay lại",
              style: KSTextStyle()
                  .style(
                    15,
                    FontWeight.w500,
                    fontBuilder: GoogleFonts.cormorantInfant,
                  )
                  .copyWith(
                    color: AppStyle.primaryColorBlack, // Nếu khóa thì đổi màu chữ
                  ),
            ),
          ),
          const Spacer(),
          SizedBox(
              height: 35,
              width: 100,
              child: KSButton(

                onTap: (){
                  EmojiPopupController().hide();
                  vm.nextImgCMT( context,);
                },
                "Tiếp tục",

                backgroundColor: AppStyle.primaryColorBlack,
              ))
        ],
      ),
    );
  }


  Widget _buildTextCMT(BuildContext context, HomeScreenVm vm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppStyle.whiteBg,
        border: Border.all(color: Colors.black, width: 0.5),
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
                  KSText("Tên hiển thị",
                      style: KSTextStyle()
                          .style(
                        18,
                        FontWeight.w700,
                        fontBuilder:
                        GoogleFonts.cormorantInfant,
                      ).copyWith(
                          color: AppStyle
                              .primaryGreen11150F)),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    onTap: (){
                      EmojiPopupController().hide();
                    },
                    controller: vm.userCMTController,
                    decoration: InputDecoration(

                      hintText: "Tên của bạn là...?",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            32), // 👈 Bo tròn
                        borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 0.5),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(32),
                        borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 1),
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
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  KSText(
                      "Bình luận của bạn",
                  style: KSTextStyle()
                      .style(
                    18,
                    FontWeight.w700,
                    fontBuilder:
                    GoogleFonts.cormorantInfant,
                  ).copyWith(
                          color: AppStyle
                              .primaryGreen11150F)),
                  SizedBox(
                    height: 8,
                  ),
                  EmojiTextFieldSmall(onChanged: (String x){

                    vm.noteCMTController.text = x;
                  },),
                  // TextField(
                  //   controller: vm.noteCMTController,
                  //   minLines: 3,
                  //   maxLines: 6,
                  //   decoration: InputDecoration(
                  //     hintText: "Viết lời nhắn",
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
                  //         borderSide: const BorderSide(
                  //             color: Colors.black87,
                  //             width: 0.2),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius:
                  //       BorderRadius.circular(8),
                  //       borderSide: const BorderSide(
                  //           color: Colors.black87,
                  //           width: 1),
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
              Row(
                children: [
                  Spacer(),
                  MouseRegion(
                    hitTestBehavior: HitTestBehavior.translucent,
                    onEnter: (_) => vm.setHover(true),
                    onExit: (_) => vm.setHover(false),
                    child:    AnimatedScale(
                      duration: const Duration(milliseconds: 200),
                      scale:  vm.isHover ? 1.1 : 1.0,
                      child:  Container(


                          width: 100,
                          height: 35,
                          child: KSButton(
                            radius: 32,

                            onTap: (){
                              EmojiPopupController().hide();
                              vm.postCMTImage(context);
                              // vm.postWish(context);
                            },
                            "Gửi ngay",
                            backgroundColor: AppStyle.primaryGreen617855,

                          )),
                    ),

                  ),


                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCommentSection(BuildContext context, HomeScreenVm vm) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: vm.isExpandedCMT
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstChild: _buildInputField(context, vm),
      secondChild: SingleChildScrollView(
        child: _buildTextCMT(context, vm),
      ),
    );

  }
}



class MessagePopupDialogMobile extends StatelessWidget {
  const MessagePopupDialogMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeScreenVm>(context);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 778 + 64,
        width: 518 + 518,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppStyle.primaryGreenCAD1C6, AppStyle.whiteBg],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: vm.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Ảnh cưới bên trái
                  Expanded(
                    flex:3,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            vm.linkUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return LoadingLottie();
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(child: Icon(Icons.broken_image, size: 40));
                            },
                          ),
                        ),

                        Positioned(
                          top: 8,
                          left: 8,
                          child: KSInkWellUnFocus(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:Icon(Icons.close, color: Colors.black, size: 15)
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: _buildFooter(vm, context),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Input + danh sách lời nhắn
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 16), // optional
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCommentSection(context, vm),
                                const SizedBox(height: 16),
                                _buildMessageList(vm),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, HomeScreenVm vm) {


    return InkWell(
      onTap: (){

      },
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              onTap: (){
                vm.setExpandedCMT(true);
              },
              // controller: vm.controllerCMT,
              decoration: InputDecoration(
                hintText: 'Để lại lời nhắn...',
                hintStyle: KSTextStyle()
                    .style(
                  12,
                  FontWeight.w700,
                  fontBuilder: GoogleFonts.cormorantInfant,
                )
                    .copyWith(
                  color:
                  AppStyle.primaryGreen647B58, // Nếu khóa thì đổi màu chữ
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      print("bấm");
                      vm.setExpandedCMT(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle.primaryGreen617855,
                    ),
                    child: Text(
                      "Gửi ngay",
                      style: KSTextStyle()
                          .style(
                        12,
                        FontWeight.w700,
                        fontBuilder: GoogleFonts.cormorantInfant,
                      )
                          .copyWith(
                        color: AppStyle.whiteBg, // Nếu khóa thì đổi màu chữ
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(HomeScreenVm vm) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: vm.messages.length + 1, // thêm 1 item ở cuối
      itemBuilder: (context, index) {
        if (index == vm.messages.length) {
          if (!vm.hasMoreComments) return const SizedBox.shrink();

          final remaining = vm.totalComments - vm.messages.length;
          final toLoad = remaining >= 5 ? 5 : remaining;

          return vm.isLoadingMoreCMT
              ? LoadingLottie(height: 100,)
              : GestureDetector(
            onTap: () => vm.next10CMT(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // Gạch chân tự định nghĩa
                  Container(
                    height: 1,
                    width: 170, // 👉 chỉnh chiều dài gạch chân ở đây
                    color: Colors.black,
                  ),
                  // Nội dung chữ
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2), // 👉 khoảng cách giữa text và line
                    child: Text(
                      'Xem thêm $toLoad lời nhắn khác',
                      style: KSTextStyle()
                          .style(
                        15,
                        FontWeight.w700,
                        fontBuilder: GoogleFonts.cormorantInfant,
                      )
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),

            ),
          );
        }


        final msg = vm.messages[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg.userName,
                style: KSTextStyle()
                    .style(
                  14,
                  FontWeight.w700,
                  fontBuilder: GoogleFonts.cormorantInfant,
                )
                    .copyWith(
                  color: AppStyle.primaryColorBlack,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                msg.comment,
                style: KSTextStyle()
                    .style(
                  13,
                  FontWeight.w400,
                  fontBuilder: GoogleFonts.cormorantInfant,
                )
                    .copyWith(
                  color: AppStyle.primaryColorBlack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }




  Widget _buildFooter(HomeScreenVm vm,  BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(vm.indexList != 0)
            InkWell(
              onTap: () async {
                await loadDataWithLoading(
                  action: () async {
                    EmojiPopupController().hide();
                    vm.preImgCMT(  context,); // ✅ Hàm TestBug được chạy sau khi loading hiển thị xong
                  },
                );


              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppStyle.whiteBg
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back, size: 10,),
                ),
              )
            ),
          const Spacer(),
          InkWell(
              onTap: () async {
                await loadDataWithLoading(
                  action: () async {
                    EmojiPopupController().hide();
                    vm.nextImgCMT( context,); // ✅ Hàm TestBug được chạy sau khi loading hiển thị xong
                  },
                );


              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyle.whiteBg
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward, size: 10,),
                ),
              )
          ),
        ],
      ),
    );
  }


  Widget _buildTextCMT(BuildContext context, HomeScreenVm vm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppStyle.whiteBg,
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Center(
        child: Padding(
          padding: AppStyle.padding_all_16()
              .copyWith(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  KSText("Tên hiển thị",
                      style: KSTextStyle()
                          .style(
                        13,
                        FontWeight.w700,
                        fontBuilder:
                        GoogleFonts.cormorantInfant,
                      ).copyWith(
                          color: AppStyle
                              .primaryGreen11150F)),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    onTap: (){

                      EmojiPopupController().hide();
                    },
                    controller: vm.userCMTController,
                    decoration: InputDecoration(

                      hintText: "Tên của bạn là...?",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            32), // 👈 Bo tròn
                        borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 0.5),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(32),
                        borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 1),
                      ),
                    ),
                    style: KSTextStyle()
                        .style(
                      11,
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
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  KSText(
                      "Bình luận của bạn",
                      style: KSTextStyle()
                          .style(
                        15,
                        FontWeight.w700,
                        fontBuilder:
                        GoogleFonts.cormorantInfant,
                      ).copyWith(
                          color: AppStyle
                              .primaryGreen11150F)),
                  SizedBox(
                    height: 8,
                  ),

                  EmojiTextFieldMobile(onChanged: (String x){

                    vm.noteCMTController.text = x;
                  },),
                  // TextField(
                  //   controller: vm.noteCMTController,
                  //   minLines: 3,
                  //   maxLines: 6,
                  //   decoration: InputDecoration(
                  //     hintText: "Viết lời nhắn",
                  //     filled: true,
                  //     hintStyle: KSTextStyle()
                  //         .style(
                  //       11,
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
                  //       borderSide: const BorderSide(
                  //           color: Colors.black87,
                  //           width: 0.2),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius:
                  //       BorderRadius.circular(8),
                  //       borderSide: const BorderSide(
                  //           color: Colors.black87,
                  //           width: 1),
                  //     ),
                  //   ),
                  //   style: KSTextStyle()
                  //       .style(
                  //     11,
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
              Row(
                children: [
                  Spacer(),
                  Container(


                      width: 100,
                      height: 35,
                      child: KSButton(
                        radius: 32,

                        onTap: (){

                          vm.postCMTImage(context);
                          // vm.postWish(context);
                        },
                        "Gửi ngay",
                        backgroundColor: AppStyle.primaryGreen617855,

                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCommentSection(BuildContext context, HomeScreenVm vm) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: vm.isExpandedCMT
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstChild: _buildInputField(context, vm),
      secondChild: SingleChildScrollView(
        child: _buildTextCMT(context, vm),
      ),
    );

  }
}




class EmojiTextField extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const EmojiTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<EmojiTextField> createState() => _EmojiTextFieldState();
}

class _EmojiTextFieldState extends State<EmojiTextField> {
  late final EmojiTextEditingController _controller;
  late final TextStyle _emojiTextStyle;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _emojiOverlay;

  final bool isApple = [TargetPlatform.iOS, TargetPlatform.macOS]
      .contains(foundation.defaultTargetPlatform);

  @override
  void initState() {
    super.initState();
    _emojiTextStyle = DefaultEmojiTextStyle.copyWith(
          fontFamily: 'NotoColorEmoji',
      fontSize: 13 * (isApple ? 1.2 : 1.0),
    );
    _controller = EmojiTextEditingController(emojiTextStyle: _emojiTextStyle);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
  }

  void _showEmojiPopup() {
    if (_emojiOverlay != null) return;

    _emojiOverlay = OverlayEntry(
      builder: (context) => Positioned(
        width: 400,
        height: 250,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset:   Offset(MediaQuery.of(context).size.width/2 + -300,20 ), // điều chỉnh vị trí popup
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: EmojiPicker(
              textEditingController: _controller,
              config: Config(
                emojiTextStyle: _emojiTextStyle,
                checkPlatformCompatibility: true,
                emojiViewConfig: const EmojiViewConfig(
                  emojiSizeMax: 13,
                  // crossAxisCount: 8,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_emojiOverlay!);
  }

  void _hideEmojiPopup() {
    EmojiPopupController().hide();
  }

  void _toggleEmojiPopup() {
    if (EmojiPopupController().isShowing) {
      EmojiPopupController().hide();
    } else {
      EmojiPopupController().show(
        context: context,
        layerLink: _layerLink,
        offset:  Offset(MediaQuery.of(context).size.width/2 + -270,60 ),
        width: 400,
        height: 250,
        child: EmojiPicker(
          textEditingController: _controller,
          config: Config(
            emojiTextStyle: _emojiTextStyle,
            checkPlatformCompatibility: false,
            emojiViewConfig: const EmojiViewConfig(
              emojiSizeMax: 13,
            ),
            locale: Locale('vi', 'VN'),
            bottomActionBarConfig: const BottomActionBarConfig(
              showBackspaceButton: false,
              showSearchViewButton: false,
              backgroundColor: Colors.transparent, // hoặc bỏ qua nếu cần
            ),
          ),
        ),
      );
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    _hideEmojiPopup();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return CompositedTransformTarget(
  //     link: _layerLink,
  //     child: TextField(
  //       controller: _controller,
  //       style: const TextStyle(fontSize: 20.0, color: Colors.black87),
  //       maxLines: 1,
  //       decoration: InputDecoration(
  //         hintText: 'Type a message...',
  //         filled: true,
  //         fillColor: Colors.white,
  //         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         suffixIcon: IconButton(
  //           icon: const Icon(Icons.emoji_emotions_outlined),
  //           onPressed: _toggleEmojiPopup,
  //         ),
  //       ),
  //       onTap: _hideEmojiPopup,
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child:    Stack(
        children: [
          // ValueListenableBuilder(
          //   valueListenable: _controller,
          //   builder: (context, value, _) {
          //     return Text('Nội dung hiện tại: ${_controller.text}');
          //   },
          // ),
          TextField(
            onTap: _hideEmojiPopup,
            controller: _controller,
            minLines: 5,
            maxLines: 7,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(

              // suffix: Align(
              //   alignment: Alignment.topRight,
              //   child: Container(color: AppStyle.primaryColorBlack,
              //     child: IconButton(
              //       icon: const Icon(Icons.emoji_emotions_outlined),
              //       onPressed: _toggleEmojiPopup,
              //     ),
              //   ),
              // ),
              hintText: "Nhập lời muốn nói",
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
              contentPadding: const EdgeInsets.fromLTRB(16, 16, 56, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                const BorderSide(color: Colors.black87),
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
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              onPressed: _toggleEmojiPopup,
            ),
          ),
        ],
      ),
    );
  }
}


class EmojiTextFieldMobile extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const EmojiTextFieldMobile({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<EmojiTextFieldMobile> createState() => _EmojiTextFieldMobileState();
}

class _EmojiTextFieldMobileState extends State<EmojiTextFieldMobile> {
  late final EmojiTextEditingController _controller;
  late final TextStyle _emojiTextStyle;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _emojiOverlay;

  final bool isApple = [TargetPlatform.iOS, TargetPlatform.macOS]
      .contains(foundation.defaultTargetPlatform);

  @override
  void initState() {
    super.initState();
    _emojiTextStyle = DefaultEmojiTextStyle.copyWith(
          fontFamily: 'NotoColorEmoji',
      fontSize: 13 * (isApple ? 1.2 : 1.0),
    );
    _controller = EmojiTextEditingController(emojiTextStyle: _emojiTextStyle);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
  }

  void _showEmojiPopup() {
    if (_emojiOverlay != null) return;

    _emojiOverlay = OverlayEntry(
      builder: (context) => Positioned(
        width: 400,
        height: 250,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset:   Offset(MediaQuery.of(context).size.width/2 + -300,20 ), // điều chỉnh vị trí popup
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: EmojiPicker(
              textEditingController: _controller,
              config: Config(
                emojiTextStyle: _emojiTextStyle,
                checkPlatformCompatibility: true,
                emojiViewConfig: const EmojiViewConfig(
                  emojiSizeMax: 13,
                  // crossAxisCount: 8,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_emojiOverlay!);
  }

  void _hideEmojiPopup() {
    EmojiPopupController().hide();
  }

  void _toggleEmojiPopup() {
    if (EmojiPopupController().isShowing) {
      EmojiPopupController().hide();
    } else {
      EmojiPopupController().show(
        context: context,
        layerLink: _layerLink,
        offset:  Offset(0,60 ),
        width: MediaQuery.of(context).size.width -100,
        height: 250,
        child: EmojiPicker(
          textEditingController: _controller,
          config: Config(
            emojiTextStyle: _emojiTextStyle,
            checkPlatformCompatibility: false,
            emojiViewConfig: const EmojiViewConfig(
              emojiSizeMax: 13,
            ),
            locale: Locale('vi', 'VN'),
            bottomActionBarConfig: const BottomActionBarConfig(
              showBackspaceButton: false,
              showSearchViewButton: false,
              backgroundColor: Colors.transparent, // hoặc bỏ qua nếu cần
            ),
          ),
        ),
      );
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    _hideEmojiPopup();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child:    Stack(
        children: [
          // ValueListenableBuilder(
          //   valueListenable: _controller,
          //   builder: (context, value, _) {
          //     return Text('Nội dung hiện tại: ${_controller.text}');
          //   },
          // ),
          TextField(
            onTap: _hideEmojiPopup,
            controller: _controller,
            minLines: 5,
            maxLines: 7,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(

              // suffix: Align(
              //   alignment: Alignment.topRight,
              //   child: Container(color: AppStyle.primaryColorBlack,
              //     child: IconButton(
              //       icon: const Icon(Icons.emoji_emotions_outlined),
              //       onPressed: _toggleEmojiPopup,
              //     ),
              //   ),
              // ),
              hintText: "Nhập lời muốn nói",
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
              contentPadding: const EdgeInsets.fromLTRB(16, 16, 56, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                const BorderSide(color: Colors.black87),
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
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              onPressed: _toggleEmojiPopup,
            ),
          ),
        ],
      ),
    );
  }
}


class EmojiTextFieldSmall extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const EmojiTextFieldSmall({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<EmojiTextFieldSmall> createState() => _EmojiTextFieldSmallState();
}

class _EmojiTextFieldSmallState extends State<EmojiTextFieldSmall> {
  late final EmojiTextEditingController _controller;
  late final TextStyle _emojiTextStyle;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _emojiOverlay;

  final bool isApple = [TargetPlatform.iOS, TargetPlatform.macOS]
      .contains(foundation.defaultTargetPlatform);

  @override
  void initState() {
    super.initState();
    _emojiTextStyle = DefaultEmojiTextStyle.copyWith(
          fontFamily: 'NotoColorEmoji',
      fontSize: 13 * (isApple ? 1.2 : 1.0),
    );
    _controller = EmojiTextEditingController(emojiTextStyle: _emojiTextStyle);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
  }

  void _showEmojiPopup() {
    if (_emojiOverlay != null) return;

    _emojiOverlay = OverlayEntry(
      builder: (context) => Positioned(
        width: 400,
        height: 250,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset:   Offset(MediaQuery.of(context).size.width/2 + -300,20 ), // điều chỉnh vị trí popup
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: EmojiPicker(
              textEditingController: _controller,
              config: Config(
                emojiTextStyle: _emojiTextStyle,
                checkPlatformCompatibility: true,
                emojiViewConfig: const EmojiViewConfig(
                  emojiSizeMax: 13,
                  // crossAxisCount: 8,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_emojiOverlay!);
  }

  void _hideEmojiPopup() {
    EmojiPopupController().hide();
  }

  void _toggleEmojiPopup() {
    if (EmojiPopupController().isShowing) {
      EmojiPopupController().hide();
    } else {
      EmojiPopupController().show(
        context: context,
        layerLink: _layerLink,
        offset:  Offset(MediaQuery.of(context).size.width/2 + -500,60 ),
        width: 400,
        height: 250,
        child: EmojiPicker(
          textEditingController: _controller,
          config: Config(
            emojiTextStyle: _emojiTextStyle,
            checkPlatformCompatibility: false,
            emojiViewConfig: const EmojiViewConfig(
              emojiSizeMax: 13,
            ),
            locale: Locale('vi', 'VN'),
            bottomActionBarConfig: const BottomActionBarConfig(
              showBackspaceButton: false,
              showSearchViewButton: false,
              backgroundColor: Colors.transparent, // hoặc bỏ qua nếu cần
            ),

          ),

        ),
      );
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    _hideEmojiPopup();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return CompositedTransformTarget(
  //     link: _layerLink,
  //     child: TextField(
  //       controller: _controller,
  //       style: const TextStyle(fontSize: 20.0, color: Colors.black87),
  //       maxLines: 1,
  //       decoration: InputDecoration(
  //         hintText: 'Type a message...',
  //         filled: true,
  //         fillColor: Colors.white,
  //         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         suffixIcon: IconButton(
  //           icon: const Icon(Icons.emoji_emotions_outlined),
  //           onPressed: _toggleEmojiPopup,
  //         ),
  //       ),
  //       onTap: _hideEmojiPopup,
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child:    Stack(
        children: [
          // ValueListenableBuilder(
          //   valueListenable: _controller,
          //   builder: (context, value, _) {
          //     return Text('Nội dung hiện tại: ${_controller.text}');
          //   },
          // ),
          TextField(
            onTap: _hideEmojiPopup,
            controller: _controller,
            minLines: 5,
            maxLines: 7,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(

              // suffix: Align(
              //   alignment: Alignment.topRight,
              //   child: Container(color: AppStyle.primaryColorBlack,
              //     child: IconButton(
              //       icon: const Icon(Icons.emoji_emotions_outlined),
              //       onPressed: _toggleEmojiPopup,
              //     ),
              //   ),
              // ),
              hintText: "Nhập lời muốn nói",
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
              contentPadding: const EdgeInsets.fromLTRB(16, 16, 56, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                const BorderSide(color: Colors.black87),
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
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              onPressed: _toggleEmojiPopup,
            ),
          ),
        ],
      ),
    );
  }
}

class EmojiPopupController {
  static final EmojiPopupController _instance = EmojiPopupController._internal();
  factory EmojiPopupController() => _instance;
  EmojiPopupController._internal();

  OverlayEntry? _overlayEntry;

  void show({
    required BuildContext context,
    required LayerLink layerLink,
    required Widget child,
    Offset offset = Offset.zero,
    double width = 300,
    double height = 250,
  }) {
    hide(); // đảm bảo chỉ 1 popup tồn tại

    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        width: width,
        height: height,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: offset,
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: child,
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool get isShowing => _overlayEntry != null;
}
