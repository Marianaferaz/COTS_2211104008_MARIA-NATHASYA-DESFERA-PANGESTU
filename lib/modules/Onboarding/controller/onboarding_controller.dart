import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // State or business logic for Onboarding
  var pageIndex = 0.obs;

  void updatePageIndex(int index) {
    pageIndex.value = index;
  }

  void goToLogin() {
    Get.toNamed('/login');
  }
}
