import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/Login_reg/bindings/login_binding.dart';
import 'routes/app_routes.dart';
import 'modules/Boardpage/homepage.dart';
import 'modules/Boardpage/pesananpage.dart';
import 'modules/Boardpage/promopage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      getPages: AppRoutes.pages,
    );
  }
}

class AppRoutes {
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const home = '/home';
  static const promo = '/promo';
  static const orders = '/orders';

  static final pages = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(
      name: login,
      page: () => const Placeholder(), // Ganti dengan halaman login Anda.
      binding: LoginBinding(),
    ),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: promo, page: () => const PromoPage()),
    GetPage(name: orders, page: () => const PesananPage()),
  ];
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _images = [
    'assets/ilustration1.png', // Ganti dengan path gambar pertama
    'assets/ilustration2.png', // Ganti dengan path gambar kedua
    'assets/ilustration3.png', // Ganti dengan path gambar ketiga
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % _images.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Image Section
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Transportasi & logistik',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == _currentPage ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Masuk', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Belum ada akun?, Daftar dulu',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
