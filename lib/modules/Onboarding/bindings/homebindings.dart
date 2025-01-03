import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../controller/logincontroller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => LoginController());
  }
}
