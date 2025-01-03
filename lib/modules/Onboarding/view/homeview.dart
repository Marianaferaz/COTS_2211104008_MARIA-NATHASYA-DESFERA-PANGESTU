import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/custombutton.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset('assets/gojek_logo.png', width: 40),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: const Text(
                'IND',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Image.asset(
            'assets/illustration1.png',
            width: 250,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          const Text(
            'Selamat datang di gojek!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.pageIndex.value == index ? 10 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == index
                        ? Colors.green
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            );
          }),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Masuk',
            color: Colors.green,
            onPressed: controller.goToLogin,
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Belum ada akun?, Daftar dulu',
            color: Colors.white,
            borderColor: Colors.green,
            textColor: Colors.green,
            onPressed: controller.goToLogin,
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
