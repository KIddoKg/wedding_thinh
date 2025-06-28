import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_hkn/screens/home/model/user_comment_model.dart';

import '../../../services/services.dart';
import '../../../share/app_imports.dart';
import '../../../share/share_on_app.dart';
import '../model/comment_model.dart';
import '../model/media_file_model.dart';

class HomeScreenVm extends ChangeNotifier {
  /// 🔄 Reset all data
  void reset() {}
  final Map<String, String> contentMap = {
    "1": "1.",
    "2": "2",
    "3": "3",
    "4": "4",
    "5": "5",
  };

  String? selected;

  final ScrollController scrollController = ScrollController();
  bool lockScroll = false;

  void scrollToTop() {
    lockScroll = true;
    notifyListeners(); // Tạm khóa để tránh người dùng tương tác khi đang animate

    scrollController
        .animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    )
        .then((_) {
      lockScroll = false;
      notifyListeners(); // ✅ Mở lại scroll sau khi scroll animate xong
    });
  }

  void setScrollLock(bool lock) {
    // if (lockScroll != lock) {
    //   lockScroll = lock;
    //   notifyListeners();
    // }
  }

  final String mapUrl = '';

  Future<void> launchMap(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Không mở được Google Maps';
    }
  }

  final GlobalKey infoKey = GlobalKey();
  final GlobalKey loveKey = GlobalKey();
  final GlobalKey scheduleKey = GlobalKey();
  final GlobalKey goKey = GlobalKey();
  final GlobalKey<ExpandableRevealPanelState> panelKey =
      GlobalKey<ExpandableRevealPanelState>();

  Future<void> scrollToTarget(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    await Future.delayed(const Duration(milliseconds: 400), () {
      panelKey.currentState?.collapse();
    });
  }

  final List<ChatBubbleData> bubbles = [];

  void ab(BuildContext context) {
    double widthab = MediaQuery.of(context).size.width;

    int index = 0;
    final now = DateTime.now(); // hoặc DateTime(2025, 6, 27, 11)
    Future.doWhile(() async {
      final data = cmtWish![index];

      final randomLeft = Random().nextDouble() * (widthab - 250);
      final bubble = ChatBubbleData(
        name: data.userName,
        time: formatTimeAgo(int.parse(data.initTime)),
        message: data.comment,
        left: randomLeft,
      );

      bubbles.add(bubble);
      notifyListeners();

      index = (index + 1) % cmtWish!.length; // quay lại từ đầu nếu hết

      await Future.delayed(const Duration(milliseconds: 800));
      return true; // tiếp tục lặp mãi
    });
    notifyListeners();
  }

  String formatTimeAgo(int timestampMillis) {
    final now = DateTime.now();
    final date = DateTime.fromMillisecondsSinceEpoch(timestampMillis);
    final diff = now.difference(date);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} phút trước';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} giờ trước';
    } else {
      return '${diff.inDays} ngày trước';
    }
  }

  List<ChatBubbleData> generateSampleBubbles({
    required TickerProvider vsync,
    required double screenWidth,
    int count = 10,
  }) {
    final random = Random();
    final names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
    final messages = [
      'Hey there!',
      'How’s it going?',
      'Flutter is awesome!',
      'Check this out!',
      'BRB, coffee time ☕',
    ];

    return List.generate(count, (index) {
      final controller = AnimationController(
        vsync: vsync,
        duration: const Duration(seconds: 3),
      );

      return ChatBubbleData(
        name: names[random.nextInt(names.length)],
        time: '${random.nextInt(59) + 1} sec ago',
        message: messages[random.nextInt(messages.length)],
        left: random.nextDouble() * (screenWidth - 250),
        // controller: controller..forward(),
      );
    });
  }

  final DateTime targetDate = DateTime(2025, 7, 14, 8, 0);
  late final Timer _timer;

  int dayTens = 0;
  int dayUnits = 0;
  int hourTens = 0;
  int hourUnits = 0;
  int minuteTens = 0;
  int minuteUnits = 0;

  HomeScreenVm() {
    _startCountdownTimer();
    getListImg();
  }

  void _startCountdownTimer() {
    _updateCountdown();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (_) => _updateCountdown());
  }

  void _updateCountdown() {
    final now = DateTime.now();
    final diff = targetDate.difference(now);
    if (diff.isNegative) return;

    final totalMinutes = diff.inMinutes;
    final totalHours = diff.inHours;
    final totalDays = diff.inDays;

    final remainingMinutes = totalMinutes % 60;
    final remainingHours = totalHours % 24;

    dayTens = totalDays ~/ 10;
    dayUnits = totalDays % 10;
    hourTens = remainingHours ~/ 10;
    hourUnits = remainingHours % 10;
    minuteTens = remainingMinutes ~/ 10;
    minuteUnits = remainingMinutes % 10;

    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List<UserCommentModel>? cmtWish;

  int page = 1;
  int pageSize = 100;

  Future<void> getWishCMT(BuildContext context) async {
    var res =
        await Services.instance.setContext(context).getWish(page, pageSize);
    if (res.isSuccess) {
      cmtWish = res.castList<UserCommentModel>(fromJson: res.data['data']);

      ab(context);
    }
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController noteContoller = TextEditingController();

  Future<void> postInvitation(
    BuildContext context,
  ) async {
    if (nameController.text.isEmpty || noteContoller.text.isEmpty) {
      // showAlertIOS(context, 'Thông báo', "Vui lòng điền đầy đủ thông tin");
      showCustomDialog(
          context: context,
          imageAsset: Assets.png.pngWaring.keyName,
          title: '😢 Đừng bỏ qua nha...',
          detail:
              'Chỉ vài chữ thôi cũng được, miễn là mình biết bạn là ai. \nĐừng lặng lẽ rời đi nhé.');
      return;
    }
    var res = await Services.instance.setContext(context).postInvitation(
        nameController.text, int.parse(selected ?? "1"), noteContoller.text);
    if (res == true) {
      // cmtWish = res.castList<UserCommentModel>(fromJson: res.data['data']);
      //
      // ab(context);

      // showAlertIOS(context, 'Thông báo', 'Đã gửi thông tin cho vợ chồng son');
      showCustomDialog(
          context: context,
          imageAsset: Assets.png.pngSuccess.keyName,
          title: '🎉 Cảm ơn bạn đã gửi lời chúc',
          detail:
          'Chúng tôi đã nhận được lời chúc của bạn, cảm ơn bạn rất nhiều \nvì đã gửi đến những lời tốt đẹp như thế!.');
    }
  }

  TextEditingController usernameController = TextEditingController();

  TextEditingController cmtContoller = TextEditingController();

  Future<void> postWish(
    BuildContext context,
  ) async {
    if (usernameController.text.isEmpty || cmtContoller.text.isEmpty) {
      showCustomDialog(
          context: context,
          imageAsset: Assets.png.pngWaring.keyName,
          title: '😢 Đừng bỏ qua nha...',
          detail:
          'Chỉ vài chữ thôi cũng được, miễn là mình biết bạn là ai. \nĐừng lặng lẽ rời đi nhé.');
      return;
    }
    var res = await Services.instance
        .setContext(context)
        .postWish(usernameController.text, cmtContoller.text);
    if (res == true) {
      getWishCMT(context);
      showCustomDialog(
          context: context,
          imageAsset: Assets.png.pngSuccess.keyName,
          title: '🎉 Cảm ơn bạn đã gửi lời chúc',
          detail:
          'Chúng tôi đã nhận được lời chúc của bạn, cảm ơn bạn rất nhiều \nvì đã gửi đến những lời tốt đẹp như thế!.');
    }
  }

  // late final AnimationController lottieController;
  //
  // final AudioPlayer _player = AudioPlayer();
  // bool _isPlaying = false;
  //
  // bool get isPlaying => _isPlaying;
  //
  // Future<void> toggleAudio() async {
  //   if (_isPlaying) {
  //     await _player.pause();
  //   } else {
  //     if (_player.audioSource == null) {
  //       await _player.setAsset(Assets.mp3.goldenHour);
  //       await _player.setLoopMode(LoopMode.one);
  //     }
  //     await _player.play();
  //   }
  //   _isPlaying = !_isPlaying;
  //   notifyListeners();
  // }
  //
  // void disposePlayer() {
  //   _player.dispose();
  // }

// ====== AUDIO ======
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  bool _isAnimating = false;

  // ====== LOTTIE ======
  late final AnimationController lottieController;

  bool get isPlaying => _isPlaying;

  Future<void> initAudioLottie(TickerProvider vsync) async {
    lottieController = AnimationController(vsync: vsync);
  }

  void disposeAudioLottie() {
    _player.dispose();
    lottieController.dispose();
  }

  void setLottieDuration(Duration duration) {
    lottieController.duration = duration;
  }

  bool isb = false;

  Future<void> setPlay() async {
    print("object");
    if (!isb) {
      print("objecta");
      if (_player.audioSource == null) {
        await _player.setAsset(Assets.mp3.goldenHour);
        await _player.setLoopMode(LoopMode.one);
      }
      _player.play();
      _isPlaying = true;
      isb = true;
    }

    notifyListeners();
  }

  Future<void> toggleAudioLottie() async {
    if (_isAnimating || lottieController.isAnimating) return;
    _isAnimating = true;
    notifyListeners();

    try {
      if (_isPlaying) {
        await _player.pause();
        await lottieController.animateTo(
          0.666,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        print("dừng");
      } else {
        if (_player.audioSource == null) {
          await _player.setAsset(Assets.mp3.goldenHour);
          await _player.setLoopMode(LoopMode.one);
        }

        lottieController
            .animateTo(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        )
            .whenComplete(() async {
          await _player.play();
        });
      }

      print("cha ạ");
      _isPlaying = !_isPlaying;
    } catch (e) {
      print('toggleAudioLottie error: $e');
    } finally {
      _isAnimating = false;
      notifyListeners();
    }
  }

  Future<void> toggleLottieAnimation() async {
    if (_isAnimating) return;
    _isAnimating = true;
    notifyListeners();

    _isPlaying = !_isPlaying;
    _isAnimating = false;
    notifyListeners();
  }

  String? idImg;

  int pageCMT = 1;
  int pageSizeCMT = 10;
  bool hasMoreComments = true;
  bool isLoading = false;
  int totalComments = 0;
  List<CommentModel> messages = [];

  bool isLoadingMoreCMT = false;

  Future<void> getListCMTImage(BuildContext context) async {
    if (pageSizeCMT == 5)
      isLoading = true;
    else
      isLoadingMoreCMT = true;
    notifyListeners();

    final res = await Services.instance
        .setContext(context)
        .getListCMTImage(idImg ?? "d", pageCMT, pageSizeCMT);

    if (res.isSuccess) {
      final newMessages =
          res.castList<CommentModel>(fromJson: res.data['data']);

      if (pageCMT == 1) {
        messages = newMessages;
      } else {
        messages.addAll(newMessages);
      }

      hasMoreComments = res.data['meta']['canNext'];
      totalComments = int.parse(res.data['meta']['total'].toString());
    }

    isLoading = false;
    isLoadingMoreCMT = false;
    notifyListeners();
  }

  void next10CMT(BuildContext context) {
    pageSizeCMT += 5;
    pageCMT = 1;
    getListCMTImage(context);
  }

  String linkUrl = "";

  Future<void> getLinkImg(
    BuildContext context,
  ) async {
    var res = await Services.instance.setContext(context).getLinkImg(customImg);
    if (res.isSuccess) {
      linkUrl = res.data['data']['url'];
    }
    notifyListeners();
  }

  // Future<void> fetchMessages() async {
  //   isLoading = true;
  //   notifyListeners();
  //
  //   await Future.delayed(Duration(seconds: 2)); // API giả lập
  //   messages = [
  //     CommentModel(name: "Bảo", message: "Chúc mừng hai bạn!"),
  //     CommentModel(name: "Minh", message: "Trăm năm hạnh phúc nha!"),
  //   ];
  //
  //   isLoading = false;
  //   notifyListeners();
  // }
  final controllerCMT = TextEditingController();

  void sendMessage(String msg) {
    // Gửi lời nhắn logic ở đây...
    // messages.insert(0, CommentModel(name: "Bạn", message: msg));
    notifyListeners();
  }

  bool isExpandedCMT = false;

  void setExpandedCMT(bool value) {
    isExpandedCMT = value;
    notifyListeners();
  }

  TextEditingController userCMTController = TextEditingController();
  TextEditingController noteCMTController = TextEditingController();

  Future<void> postCMTImage(
    BuildContext context,
  ) async {
    if (userCMTController.text.isEmpty || noteCMTController.text.isEmpty) {
      showCustomDialog(
          context: context,
          imageAsset: Assets.png.pngWaring.keyName,
          title: '😢 Đừng bỏ qua nha...',
          detail:
          'Chỉ vài chữ thôi cũng được, miễn là mình biết bạn là ai. \nĐừng lặng lẽ rời đi nhé.');
      return;
    }
    var res = await Services.instance
        .setContext(context)
        .postCMTImage(idImg!, userCMTController.text, noteCMTController.text);
    if (res.isSuccess) {
      page = 1;
      getListCMTImage(
        context,
      );
      setExpandedCMT(false);
      // linkUrl = res.data['data']['url'];
    }
    notifyListeners();
  }

  int pageListImg = 1;
  int pageSizeListImg = 400;

  List<MediaFileModel> listImg = [];

  Future<void> getListImg() async {
    var res = await Services.instance.getListImg(pageListImg, pageSizeListImg);
    if (res.isSuccess) {
      listImg = res.castList<MediaFileModel>(fromJson: res.data['data']);
    }
    notifyListeners();
  }

  int customImg = 1;
  int indexList = 1;

  Future<void> findImg(int i, BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 300));

    MediaFileModel image = listImg[i];
    indexList = i;
    idImg = image.id;
    customImg = int.parse(image.customName ?? "1");

    // showAlertIOS(context, "title", image.id);

    await getListCMTImage(context);
    await getLinkImg(context);
    notifyListeners();
  }

  Future<void> nextImgCMT(BuildContext context) async {
    indexList++;
    MediaFileModel image = listImg[indexList];

    idImg = image.id;
    customImg = int.parse(image.customName ?? "1");
    setExpandedCMT(false);
    await getListCMTImage(context);
    await getLinkImg(context);
  }

  Future<void> preImgCMT(BuildContext context) async {
    indexList--;
    MediaFileModel image = listImg[indexList];
    idImg = image.id;
    customImg = int.parse(image.customName ?? "1");
    setExpandedCMT(false);
    await getListCMTImage(context);
    await getLinkImg(context);
  }

  void _onScroll() {
    // Ví dụ: chỉ phát nhạc nếu chưa phát
    if (!_isPlaying) {
      setPlay();
    }
  }
}
