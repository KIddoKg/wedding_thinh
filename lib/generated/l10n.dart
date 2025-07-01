// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Our love story…`
  String get my_love_story {
    return Intl.message(
      'Our love story…',
      name: 'my_love_story',
      desc: '',
      args: [],
    );
  }

  /// `is about to begin a new chapter.`
  String get step_arrangement {
    return Intl.message(
      'is about to begin a new chapter.',
      name: 'step_arrangement',
      desc: '',
      args: [],
    );
  }

  /// `Watch now`
  String get watch_now {
    return Intl.message(
      'Watch now',
      name: 'watch_now',
      desc: '',
      args: [],
    );
  }

  /// `Counting down to our wedding day.`
  String get countdown {
    return Intl.message(
      'Counting down to our wedding day.',
      name: 'countdown',
      desc: '',
      args: [],
    );
  }

  /// `With joy in our hearts, we’re happy to announce our wedding! We sincerely hope you’ll be there to celebrate this special day with us.\n The countdown has begun to one of the most meaningful moments in our lives. Don’t miss it!!`
  String get line_one {
    return Intl.message(
      'With joy in our hearts, we’re happy to announce our wedding! We sincerely hope you’ll be there to celebrate this special day with us.\n The countdown has begun to one of the most meaningful moments in our lives. Don’t miss it!!',
      name: 'line_one',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get min {
    return Intl.message(
      'Minute',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Tying the knot for a lifetime of love`
  String get hundred_years_of_love {
    return Intl.message(
      'Tying the knot for a lifetime of love',
      name: 'hundred_years_of_love',
      desc: '',
      args: [],
    );
  }

  /// `Two hearts, one journey. We’ve found each other, and now we’re ready to begin a new chapter — marriage.`
  String get line_two {
    return Intl.message(
      'Two hearts, one journey. We’ve found each other, and now we’re ready to begin a new chapter — marriage.',
      name: 'line_two',
      desc: '',
      args: [],
    );
  }

  /// `Youngest son`
  String get boy_small {
    return Intl.message(
      'Youngest son',
      name: 'boy_small',
      desc: '',
      args: [],
    );
  }

  /// `Youngest daughter`
  String get girl_small {
    return Intl.message(
      'Youngest daughter',
      name: 'girl_small',
      desc: '',
      args: [],
    );
  }

  /// `Words of love from our dearest ones`
  String get wishes_loves {
    return Intl.message(
      'Words of love from our dearest ones',
      name: 'wishes_loves',
      desc: '',
      args: [],
    );
  }

  /// `Every wish is a precious gift to our hearts — something we’ll always hold dear.`
  String get line_three {
    return Intl.message(
      'Every wish is a precious gift to our hearts — something we’ll always hold dear.',
      name: 'line_three',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for sending us your sweetest and most heartfelt messages on this special day.`
  String get line_three_add {
    return Intl.message(
      'Thank you for sending us your sweetest and most heartfelt messages on this special day.',
      name: 'line_three_add',
      desc: '',
      args: [],
    );
  }

  /// `Who’s sending us all this love?`
  String get sending_love {
    return Intl.message(
      'Who’s sending us all this love?',
      name: 'sending_love',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: Aunt Út, Uncle 6, Little Bảo,...`
  String get ex_who_sending_love {
    return Intl.message(
      'E.g.: Aunt Út, Uncle 6, Little Bảo,...',
      name: 'ex_who_sending_love',
      desc: '',
      args: [],
    );
  }

  /// `Write a wish or a memory you have with us!`
  String get enter_wish {
    return Intl.message(
      'Write a wish or a memory you have with us!',
      name: 'enter_wish',
      desc: '',
      args: [],
    );
  }

  /// `Enter your wish`
  String get ex_enter_wish {
    return Intl.message(
      'Enter your wish',
      name: 'ex_enter_wish',
      desc: '',
      args: [],
    );
  }

  /// `Send now`
  String get send_now {
    return Intl.message(
      'Send now',
      name: 'send_now',
      desc: '',
      args: [],
    );
  }

  /// `Moments of Love`
  String get moment_of_love {
    return Intl.message(
      'Moments of Love',
      name: 'moment_of_love',
      desc: '',
      args: [],
    );
  }

  /// `Come take a look at the captured moments from our journey of love.`
  String get line_four {
    return Intl.message(
      'Come take a look at the captured moments from our journey of love.',
      name: 'line_four',
      desc: '',
      args: [],
    );
  }

  /// ` Moments of Love`
  String get event_schedule {
    return Intl.message(
      ' Moments of Love',
      name: 'event_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Take a look at the special milestones of our wedding — from the traditional procession and church ceremony to the celebration banquet.`
  String get line_event_schedule {
    return Intl.message(
      'Take a look at the special milestones of our wedding — from the traditional procession and church ceremony to the celebration banquet.',
      name: 'line_event_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Holy Matrimony`
  String get item_one_name {
    return Intl.message(
      'Holy Matrimony',
      name: 'item_one_name',
      desc: '',
      args: [],
    );
  }

  /// `5:00 PM, July 11, 2025`
  String get item_one_date {
    return Intl.message(
      '5:00 PM, July 11, 2025',
      name: 'item_one_date',
      desc: '',
      args: [],
    );
  }

  /// `15 Tran Phu St., Ward 3, Da Lat`
  String get item_one_address {
    return Intl.message(
      '15 Tran Phu St., Ward 3, Da Lat',
      name: 'item_one_address',
      desc: '',
      args: [],
    );
  }

  /// `A sacred ceremony blessed under the witness of God.`
  String get item_one_detail {
    return Intl.message(
      'A sacred ceremony blessed under the witness of God.',
      name: 'item_one_detail',
      desc: '',
      args: [],
    );
  }

  /// `Click to view`
  String get see_instructions {
    return Intl.message(
      'Click to view',
      name: 'see_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Bridal Procession`
  String get item_two_name {
    return Intl.message(
      'Bridal Procession',
      name: 'item_two_name',
      desc: '',
      args: [],
    );
  }

  /// `8:00 AM, July 14, 2025`
  String get item_two_date {
    return Intl.message(
      '8:00 AM, July 14, 2025',
      name: 'item_two_date',
      desc: '',
      args: [],
    );
  }

  /// `10 Ngo Thi Sy - Ward 4, Da Lat City`
  String get item_two_address {
    return Intl.message(
      '10 Ngo Thi Sy - Ward 4, Da Lat City',
      name: 'item_two_address',
      desc: '',
      args: [],
    );
  }

  /// `A heartfelt gathering of two families, and the official moment we bring the bride home.`
  String get item_two_detail {
    return Intl.message(
      'A heartfelt gathering of two families, and the official moment we bring the bride home.',
      name: 'item_two_detail',
      desc: '',
      args: [],
    );
  }

  /// `A warm celebration`
  String get item_three_name {
    return Intl.message(
      'A warm celebration',
      name: 'item_three_name',
      desc: '',
      args: [],
    );
  }

  /// `11:30 AM, July 14, 2025`
  String get item_three_date {
    return Intl.message(
      '11:30 AM, July 14, 2025',
      name: 'item_three_date',
      desc: '',
      args: [],
    );
  }

  /// `19 Nguyen Du, Ward 9, Da Lat City`
  String get item_three_address {
    return Intl.message(
      '19 Nguyen Du, Ward 9, Da Lat City',
      name: 'item_three_address',
      desc: '',
      args: [],
    );
  }

  /// `A warm and joyful celebration with our dear friends and family.`
  String get item_three_detail {
    return Intl.message(
      'A warm and joyful celebration with our dear friends and family.',
      name: 'item_three_detail',
      desc: '',
      args: [],
    );
  }

  /// `Will you\n be join us?`
  String get will_you_come {
    return Intl.message(
      'Will you\n be join us?',
      name: 'will_you_come',
      desc: '',
      args: [],
    );
  }

  /// `Let us know you’re coming`
  String get will_you_attend {
    return Intl.message(
      'Let us know you’re coming',
      name: 'will_you_attend',
      desc: '',
      args: [],
    );
  }

  /// `Our happiness will be more complete with you by our side.`
  String get line_six {
    return Intl.message(
      'Our happiness will be more complete with you by our side.',
      name: 'line_six',
      desc: '',
      args: [],
    );
  }

  /// `Please let us know if you will be able to join us!`
  String get line_six_edd {
    return Intl.message(
      'Please let us know if you will be able to join us!',
      name: 'line_six_edd',
      desc: '',
      args: [],
    );
  }

  /// `What's your name?`
  String get know_name {
    return Intl.message(
      'What\'s your name?',
      name: 'know_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your attendance?`
  String get will_you_come_st {
    return Intl.message(
      'Confirm your attendance?',
      name: 'will_you_come_st',
      desc: '',
      args: [],
    );
  }

  /// `I’ll be there!`
  String get attend {
    return Intl.message(
      'I’ll be there!',
      name: 'attend',
      desc: '',
      args: [],
    );
  }

  /// `So sorry,  I won’t be able to attend.`
  String get no_attend {
    return Intl.message(
      'So sorry,  I won’t be able to attend.',
      name: 'no_attend',
      desc: '',
      args: [],
    );
  }

  /// `How many guests will be joining you?`
  String get many_people {
    return Intl.message(
      'How many guests will be joining you?',
      name: 'many_people',
      desc: '',
      args: [],
    );
  }

  /// `Anything you'd like to share with us?`
  String get to_say {
    return Intl.message(
      'Anything you\'d like to share with us?',
      name: 'to_say',
      desc: '',
      args: [],
    );
  }

  /// `Notes about food, allergies, seating, arrival time... anything that helps us make the party perfect for you!`
  String get give_say {
    return Intl.message(
      'Notes about food, allergies, seating, arrival time... anything that helps us make the party perfect for you!',
      name: 'give_say',
      desc: '',
      args: [],
    );
  }

  /// `Tui Ba Gang Restaurant`
  String get restauration_name {
    return Intl.message(
      'Tui Ba Gang Restaurant',
      name: 'restauration_name',
      desc: '',
      args: [],
    );
  }

  /// `(La’ Muse Hall)`
  String get restauration_name_break {
    return Intl.message(
      '(La’ Muse Hall)',
      name: 'restauration_name_break',
      desc: '',
      args: [],
    );
  }

  /// `Leave a message`
  String get give_mess {
    return Intl.message(
      'Leave a message',
      name: 'give_mess',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Your comment`
  String get comment {
    return Intl.message(
      'Your comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message`
  String get ex_comment {
    return Intl.message(
      'Enter your message',
      name: 'ex_comment',
      desc: '',
      args: [],
    );
  }

  /// `Display name`
  String get name_show {
    return Intl.message(
      'Display name',
      name: 'name_show',
      desc: '',
      args: [],
    );
  }

  /// `What’s your name?`
  String get ex_name_show {
    return Intl.message(
      'What’s your name?',
      name: 'ex_name_show',
      desc: '',
      args: [],
    );
  }

  /// `Gia Thinh & Bao Han`
  String get name {
    return Intl.message(
      'Gia Thinh & Bao Han',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get menu_info {
    return Intl.message(
      'Contact Information',
      name: 'menu_info',
      desc: '',
      args: [],
    );
  }

  /// `Moments of Love`
  String get menu_love {
    return Intl.message(
      'Moments of Love',
      name: 'menu_love',
      desc: '',
      args: [],
    );
  }

  /// `Event Schedule`
  String get menu_schedule {
    return Intl.message(
      'Event Schedule',
      name: 'menu_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Will you come?`
  String get menu_comfirm {
    return Intl.message(
      'Will you come?',
      name: 'menu_comfirm',
      desc: '',
      args: [],
    );
  }

  /// `(Send Confirmation)`
  String get menu_ok {
    return Intl.message(
      '(Send Confirmation)',
      name: 'menu_ok',
      desc: '',
      args: [],
    );
  }

  /// `Gia Thinh`
  String get name_boy {
    return Intl.message(
      'Gia Thinh',
      name: 'name_boy',
      desc: '',
      args: [],
    );
  }

  /// `Thinh`
  String get name_boy_one {
    return Intl.message(
      'Thinh',
      name: 'name_boy_one',
      desc: '',
      args: [],
    );
  }

  /// `Bao Han`
  String get name_girl {
    return Intl.message(
      'Bao Han',
      name: 'name_girl',
      desc: '',
      args: [],
    );
  }

  /// `Han`
  String get name_girl_one {
    return Intl.message(
      'Han',
      name: 'name_girl_one',
      desc: '',
      args: [],
    );
  }

  /// `Le Gia Thinh`
  String get name_boy_full {
    return Intl.message(
      'Le Gia Thinh',
      name: 'name_boy_full',
      desc: '',
      args: [],
    );
  }

  /// `Nguyen Thi Bao Han`
  String get name_girl_full {
    return Intl.message(
      'Nguyen Thi Bao Han',
      name: 'name_girl_full',
      desc: '',
      args: [],
    );
  }

  /// `Le Gia`
  String get n_name_boy {
    return Intl.message(
      'Le Gia',
      name: 'n_name_boy',
      desc: '',
      args: [],
    );
  }

  /// `Nguyen Thi`
  String get n_girl_boy {
    return Intl.message(
      'Nguyen Thi',
      name: 'n_girl_boy',
      desc: '',
      args: [],
    );
  }

  /// `😢 Don’t skip this part...`
  String get dont_skip {
    return Intl.message(
      '😢 Don’t skip this part...',
      name: 'dont_skip',
      desc: '',
      args: [],
    );
  }

  /// `Just a few words are enough, as long as we know who you are.`
  String get note_skip {
    return Intl.message(
      'Just a few words are enough, as long as we know who you are.',
      name: 'note_skip',
      desc: '',
      args: [],
    );
  }

  /// `We’ve received your message — thank you so much!`
  String get note_thanks {
    return Intl.message(
      'We’ve received your message — thank you so much!',
      name: 'note_thanks',
      desc: '',
      args: [],
    );
  }

  /// `🎉 Thank you for your wishes`
  String get thanks {
    return Intl.message(
      '🎉 Thank you for your wishes',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
