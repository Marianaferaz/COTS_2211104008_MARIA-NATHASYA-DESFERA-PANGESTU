import 'package:get/get.dart';
import '../modules/Login_reg/bindings/login_binding.dart';
import '../modules/Login_reg/view/login_view.dart';

class AppRoutes {
  static const login = '/login';

  static final pages = [
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
