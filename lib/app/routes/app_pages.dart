import 'package:get/get.dart';

import '../modules/bangunan/bindings/bangunan_binding.dart';
import '../modules/bangunan/views/bangunan_view.dart';
import '../modules/cat/bindings/cat_binding.dart';
import '../modules/cat/views/cat_view.dart';
import '../modules/data_diri/bindings/data_diri_binding.dart';
import '../modules/data_diri/views/data_diri_view.dart';
import '../modules/fill_address/bindings/fill_address_binding.dart';
import '../modules/fill_address/views/fill_address_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_builder/bindings/home_builder_binding.dart';
import '../modules/home_builder/views/home_builder_view.dart';
import '../modules/kayu/bindings/kayu_binding.dart';
import '../modules/kayu/views/kayu_view.dart';
import '../modules/listrik/bindings/listrik_binding.dart';
import '../modules/listrik/views/listrik_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/order_builder/bindings/order_builder_binding.dart';
import '../modules/order_builder/views/order_builder_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/progress_page/bindings/progress_page_binding.dart';
import '../modules/progress_page/views/progress_page_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tegel/bindings/tegel_binding.dart';
import '../modules/tegel/views/tegel_view.dart';
import '../modules/user_progress_page/bindings/user_progress_page_binding.dart';
import '../modules/user_progress_page/views/user_progress_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.DATA_DIRI,
      page: () => DataDiriView(),
      binding: DataDiriBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS_PAGE,
      page: () => ProgressPageView(),
      binding: ProgressPageBinding(),
    ),
    GetPage(
      name: _Paths.FILL_ADDRESS,
      page: () => FillAddressView(),
      binding: FillAddressBinding(),
    ),
    GetPage(
      name: _Paths.TEGEL,
      page: () => TegelView(),
      binding: TegelBinding(),
    ),
    GetPage(
      name: _Paths.CAT,
      page: () => CatView(),
      binding: CatBinding(),
    ),
    GetPage(
      name: _Paths.LISTRIK,
      page: () => ListrikView(),
      binding: ListrikBinding(),
    ),
    GetPage(
      name: _Paths.BANGUNAN,
      page: () => BangunanView(),
      binding: BangunanBinding(),
    ),
    GetPage(
      name: _Paths.KAYU,
      page: () => KayuView(),
      binding: KayuBinding(),
    ),
    GetPage(
      name: _Paths.HOME_BUILDER,
      page: () => HomeBuilderView(),
      binding: HomeBuilderBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROGRESS_PAGE,
      page: () => UserProgressPageView(),
      binding: UserProgressPageBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_BUILDER,
      page: () => OrderBuilderView(),
      binding: OrderBuilderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
  ];
}
