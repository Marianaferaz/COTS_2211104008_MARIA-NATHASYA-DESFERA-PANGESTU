import 'package:get/get.dart';
import '../view/homeview.dart';
import '../view/loginview.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';

  static final pages = [
    GetPage(name: onboarding, page: () => const OnboardingView()),
    GetPage(name: login, page: () => const LoginView()),
  ];
}
