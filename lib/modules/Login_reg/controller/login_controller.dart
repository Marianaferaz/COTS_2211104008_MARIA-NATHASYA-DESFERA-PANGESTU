import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumber = ''.obs;

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void login() {
    if (phoneNumber.value.isNotEmpty) {
      // Lakukan navigasi atau aksi login
      Get.snackbar('Success', 'Phone number: ${phoneNumber.value}');
    } else {
      Get.snackbar('Error', 'Please enter your phone number');
    }
  }
}
