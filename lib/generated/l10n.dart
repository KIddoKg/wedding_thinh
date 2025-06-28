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

  /// `Base Flutter`
  String get app_name {
    return Intl.message(
      'Base Flutter',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi hệ thống. Vui lòng thử lại!`
  String get something_wrong {
    return Intl.message(
      'Lỗi hệ thống. Vui lòng thử lại!',
      name: 'something_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang bảo trì. Vui lòng thử lại!`
  String get system_maintain {
    return Intl.message(
      'Hệ thống đang bảo trì. Vui lòng thử lại!',
      name: 'system_maintain',
      desc: '',
      args: [],
    );
  }

  /// `Không được bỏ trống`
  String get do_not_empty {
    return Intl.message(
      'Không được bỏ trống',
      name: 'do_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Nội dung không tồn tại`
  String get content_does_not_exist {
    return Intl.message(
      'Nội dung không tồn tại',
      name: 'content_does_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Công Ty TNHH HÒA KIẾN NHÂN ra đời với mong muốn giải quyết triệt để, vấn đề cho các nhà máy nhiệt điện than và vật liệu xây dựng tro bay, xỉ than trên cả nước, góp phần tận dụng nguồn tài nguyên và giảm thiểu ô nhiểm môi trường.`
  String get intro_one {
    return Intl.message(
      'Công Ty TNHH HÒA KIẾN NHÂN ra đời với mong muốn giải quyết triệt để, vấn đề cho các nhà máy nhiệt điện than và vật liệu xây dựng tro bay, xỉ than trên cả nước, góp phần tận dụng nguồn tài nguyên và giảm thiểu ô nhiểm môi trường.',
      name: 'intro_one',
      desc: '',
      args: [],
    );
  }

  /// `Xí nghiệp đã coi trọng áp dụng công nghệ thông tin vào quản lý. Đến nay đã và đang triển khai hệ thống đo bể tự động giám sát cột bơm tại các cửa hàng. Tổ chức khai thác hiệu quả hạ tầng truyền thông internet; ứng dụng chương trình quản lý văn bản.`
  String get intro_two {
    return Intl.message(
      'Xí nghiệp đã coi trọng áp dụng công nghệ thông tin vào quản lý. Đến nay đã và đang triển khai hệ thống đo bể tự động giám sát cột bơm tại các cửa hàng. Tổ chức khai thác hiệu quả hạ tầng truyền thông internet; ứng dụng chương trình quản lý văn bản.',
      name: 'intro_two',
      desc: '',
      args: [],
    );
  }

  /// `Với quy trình chuỗi cung ứng tự động hóa hoàn toàn, cắt giảm bớt những thao tác thực hiện nghiệp vụ thủ công, sai sót Việc cung ứng hàng hóa cho khách hàng được nhanh hơn, chính xác hơn, cung ứng cho khách hàng dịch vụ quản lý vận tải công nghệ trong nước và kể cả xuất nhập khẩu ngoài nước`
  String get intro_three {
    return Intl.message(
      'Với quy trình chuỗi cung ứng tự động hóa hoàn toàn, cắt giảm bớt những thao tác thực hiện nghiệp vụ thủ công, sai sót Việc cung ứng hàng hóa cho khách hàng được nhanh hơn, chính xác hơn, cung ứng cho khách hàng dịch vụ quản lý vận tải công nghệ trong nước và kể cả xuất nhập khẩu ngoài nước',
      name: 'intro_three',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone {
    return Intl.message(
      'Số điện thoại',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Lưu lại mật khẩu`
  String get save_password {
    return Intl.message(
      'Lưu lại mật khẩu',
      name: 'save_password',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgot_password {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Quay lại`
  String get back {
    return Intl.message(
      'Quay lại',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `YÊU CẦU HỖ TRỢ`
  String get request_help {
    return Intl.message(
      'YÊU CẦU HỖ TRỢ',
      name: 'request_help',
      desc: '',
      args: [],
    );
  }

  /// `Bạn không nhận được mã xác nhận. Đừng lo lắng, đội ngũ hỗ trợ sẽ liên hệ với bạn trong vòng 24 giờ để xác nhận tài khoản của bạn \nVui lòng cung cấp địa chỉ email, chúng tôi sẽ liên lạc để hỗ trợ bạn xác minh tài khoản`
  String get request_help_detail {
    return Intl.message(
      'Bạn không nhận được mã xác nhận. Đừng lo lắng, đội ngũ hỗ trợ sẽ liên hệ với bạn trong vòng 24 giờ để xác nhận tài khoản của bạn \nVui lòng cung cấp địa chỉ email, chúng tôi sẽ liên lạc để hỗ trợ bạn xác minh tài khoản',
      name: 'request_help_detail',
      desc: '',
      args: [],
    );
  }

  /// `Mô tả`
  String get description {
    return Intl.message(
      'Mô tả',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng bạn quay trở lại`
  String get hello_comeback {
    return Intl.message(
      'Chào mừng bạn quay trở lại',
      name: 'hello_comeback',
      desc: '',
      args: [],
    );
  }

  /// `Doanh thu`
  String get revenue {
    return Intl.message(
      'Doanh thu',
      name: 'revenue',
      desc: '',
      args: [],
    );
  }

  /// `Ngày tháng năm`
  String get day_sort {
    return Intl.message(
      'Ngày tháng năm',
      name: 'day_sort',
      desc: '',
      args: [],
    );
  }

  /// `so với ngày hôm qua`
  String get different_day {
    return Intl.message(
      'so với ngày hôm qua',
      name: 'different_day',
      desc: '',
      args: [],
    );
  }

  /// `Xem chi tiết`
  String get show_detail {
    return Intl.message(
      'Xem chi tiết',
      name: 'show_detail',
      desc: '',
      args: [],
    );
  }

  /// `Tổng số chuyến đi hoàn thành`
  String get total_trips_success {
    return Intl.message(
      'Tổng số chuyến đi hoàn thành',
      name: 'total_trips_success',
      desc: '',
      args: [],
    );
  }

  /// `Tỷ lệ hoàn thành`
  String get completion_rate {
    return Intl.message(
      'Tỷ lệ hoàn thành',
      name: 'completion_rate',
      desc: '',
      args: [],
    );
  }

  /// `Tỷ lệ huỷ chuyến`
  String get cancellation_rate {
    return Intl.message(
      'Tỷ lệ huỷ chuyến',
      name: 'cancellation_rate',
      desc: '',
      args: [],
    );
  }

  /// `chuyến`
  String get trips {
    return Intl.message(
      'chuyến',
      name: 'trips',
      desc: '',
      args: [],
    );
  }

  /// `Danh mục`
  String get categories {
    return Intl.message(
      'Danh mục',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Xem tất cả`
  String get view_all {
    return Intl.message(
      'Xem tất cả',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Hành trình của xe`
  String get vehicle_journey {
    return Intl.message(
      'Hành trình của xe',
      name: 'vehicle_journey',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách nhân viên`
  String get employee_list {
    return Intl.message(
      'Danh sách nhân viên',
      name: 'employee_list',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách đơn hàng`
  String get order_list {
    return Intl.message(
      'Danh sách đơn hàng',
      name: 'order_list',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách khách hàng`
  String get customer_list {
    return Intl.message(
      'Danh sách khách hàng',
      name: 'customer_list',
      desc: '',
      args: [],
    );
  }

  /// `Loại dịch vụ cung cấp`
  String get service_type_provided {
    return Intl.message(
      'Loại dịch vụ cung cấp',
      name: 'service_type_provided',
      desc: '',
      args: [],
    );
  }

  /// `Than đá`
  String get coal {
    return Intl.message(
      'Than đá',
      name: 'coal',
      desc: '',
      args: [],
    );
  }

  /// `Y tế`
  String get healthcare {
    return Intl.message(
      'Y tế',
      name: 'healthcare',
      desc: '',
      args: [],
    );
  }

  /// `Dịch vụ 1`
  String get service_1 {
    return Intl.message(
      'Dịch vụ 1',
      name: 'service_1',
      desc: '',
      args: [],
    );
  }

  /// `Dịch vụ 2`
  String get service_2 {
    return Intl.message(
      'Dịch vụ 2',
      name: 'service_2',
      desc: '',
      args: [],
    );
  }

  /// `Dịch vụ 3`
  String get service_3 {
    return Intl.message(
      'Dịch vụ 3',
      name: 'service_3',
      desc: '',
      args: [],
    );
  }

  /// `Ngành hàng`
  String get industry {
    return Intl.message(
      'Ngành hàng',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `Đang sử dụng dịch vụ`
  String get using_service {
    return Intl.message(
      'Đang sử dụng dịch vụ',
      name: 'using_service',
      desc: '',
      args: [],
    );
  }

  /// `Khách mới`
  String get new_customer {
    return Intl.message(
      'Khách mới',
      name: 'new_customer',
      desc: '',
      args: [],
    );
  }

  /// `Tên khách hàng`
  String get customer_name_uppercase {
    return Intl.message(
      'Tên khách hàng',
      name: 'customer_name_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Tên khách hàng`
  String get customer_name {
    return Intl.message(
      'Tên khách hàng',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Được tạo 14:00 14 Th 11, 2024`
  String get created_at {
    return Intl.message(
      'Được tạo 14:00 14 Th 11, 2024',
      name: 'created_at',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách đơn hàng`
  String get product_list {
    return Intl.message(
      'Danh sách đơn hàng',
      name: 'product_list',
      desc: '',
      args: [],
    );
  }

  /// `Tạo khách hàng`
  String get create_customer {
    return Intl.message(
      'Tạo khách hàng',
      name: 'create_customer',
      desc: '',
      args: [],
    );
  }

  /// `Loại khách hàng`
  String get type_customer {
    return Intl.message(
      'Loại khách hàng',
      name: 'type_customer',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ giao hàng`
  String get shipping_address {
    return Intl.message(
      'Địa chỉ giao hàng',
      name: 'shipping_address',
      desc: '',
      args: [],
    );
  }

  /// `Tên liên hệ theo địa chỉ`
  String get contact_name_by_address {
    return Intl.message(
      'Tên liên hệ theo địa chỉ',
      name: 'contact_name_by_address',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại (nhận hàng)`
  String get phone_number_receiver {
    return Intl.message(
      'Số điện thoại (nhận hàng)',
      name: 'phone_number_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Trong nước`
  String get domestic {
    return Intl.message(
      'Trong nước',
      name: 'domestic',
      desc: '',
      args: [],
    );
  }

  /// `Ngoài nước`
  String get international {
    return Intl.message(
      'Ngoài nước',
      name: 'international',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh/Thành phố, Quận/Huyện, Phường/Xã`
  String get province_city_district_ward {
    return Intl.message(
      'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã',
      name: 'province_city_district_ward',
      desc: '',
      args: [],
    );
  }

  /// `Tên đường, toà nhà, số nhà`
  String get street_building_house_number {
    return Intl.message(
      'Tên đường, toà nhà, số nhà',
      name: 'street_building_house_number',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá dịch vụ theo địa chỉ`
  String get service_price_by_address {
    return Intl.message(
      'Đơn giá dịch vụ theo địa chỉ',
      name: 'service_price_by_address',
      desc: '',
      args: [],
    );
  }

  /// `Tấn`
  String get ton {
    return Intl.message(
      'Tấn',
      name: 'ton',
      desc: '',
      args: [],
    );
  }

  /// `Mã số thuế`
  String get tax_code {
    return Intl.message(
      'Mã số thuế',
      name: 'tax_code',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú`
  String get note {
    return Intl.message(
      'Ghi chú',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Thêm địa chỉ mới`
  String get add_address {
    return Intl.message(
      'Thêm địa chỉ mới',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Khu vực được chọn`
  String get choose_area {
    return Intl.message(
      'Khu vực được chọn',
      name: 'choose_area',
      desc: '',
      args: [],
    );
  }

  /// `Thiết lập lại thiết`
  String get rest_all {
    return Intl.message(
      'Thiết lập lại thiết',
      name: 'rest_all',
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
