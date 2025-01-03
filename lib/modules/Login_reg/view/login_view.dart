import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../widgets/custom_keyboard.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your registered phone number to log in',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Phone number*',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Obx(
              () => TextFormField(
                initialValue: controller.phoneNumber.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
                onChanged: controller.updatePhoneNumber,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle issue with number action
              },
              child: const Text(
                'Issue with number?',
                style: TextStyle(color: Colors.green),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: controller.login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Continue'),
            ),
            const SizedBox(height: 16),
            CustomKeyboard(onKeyTap: controller.updatePhoneNumber),
          ],
        ),
      ),
    );
  }
}
