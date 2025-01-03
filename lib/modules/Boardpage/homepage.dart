import 'package:flutter/material.dart';
import 'package:cots_2211104008_maria/modules/Boardpage/homepage.dart';
import 'package:cots_2211104008_maria/modules/Boardpage/pesananpage.dart';
import 'package:cots_2211104008_maria/modules/Boardpage/promopage.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            hintText: 'Find services, food, or places',
            hintStyle: const TextStyle(fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.green),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gopay Section
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gopay",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Rp7.434",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQuickAction(icon: Icons.add, label: 'Top Up'),
                      _buildQuickAction(icon: Icons.payment, label: 'Pay'),
                      _buildQuickAction(icon: Icons.explore, label: 'Explore'),
                    ],
                  ),
                ],
              ),
            ),

            // Service Icons Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildServiceIcon(icon: Icons.directions_bike, label: 'GoRide'),
                  _buildServiceIcon(icon: Icons.directions_car, label: 'GoCar'),
                  _buildServiceIcon(icon: Icons.restaurant, label: 'GoFood'),
                  _buildServiceIcon(icon: Icons.local_shipping, label: 'GoSend'),
                  _buildServiceIcon(icon: Icons.shopping_cart, label: 'GoMart'),
                  _buildServiceIcon(icon: Icons.phone_iphone, label: 'GoPulsa'),
                  _buildServiceIcon(icon: Icons.card_membership, label: 'GoClub'),
                  _buildServiceIcon(icon: Icons.more_horiz, label: 'More'),
                ],
              ),
            ),

            // XP Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.blue),
                  const SizedBox(width: 16),
                  const Text(
                    "121 XP to your next treasure",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward, color: Colors.grey),
                ],
              ),
            ),

            // Restos and Promos Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryButton(label: "Restos near me", icon: Icons.restaurant),
                  _buildCategoryButton(label: "Best-seller in my area", icon: Icons.star),
                ],
              ),
            ),

            // Advertisement Section
            _buildAdCard(
              title: "Makin Seru",
              subtitle: "Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia",
              color: Colors.green[100],
            ),
            _buildAdCard(
              title: "Makin Seru",
              subtitle: "Sambungin Akun ke Tokopedia, Banyakin Untung",
              color: Colors.green[200],
            ),
            _buildAdCard(
              title: "Promo Belanja",
              subtitle: "Promo Belanja Online 10.10: Cashback hingga Rp100.000",
              color: Colors.green[300],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Promos"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }

  Widget _buildQuickAction({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blue),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildServiceIcon({required IconData icon, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 36, color: Colors.green),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCategoryButton({required String label, required IconData icon}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.green),
      label: Text(
        label,
        style: const TextStyle(color: Colors.green, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[50],
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildAdCard({required String title, required String subtitle, Color? color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
    );
  }
}

class AppRoutes {
  static const home = '/home';
  static const promo = '/promo';
  static const orders = '/orders';

  static final pages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: promo, page: () => const PromoPage()),
    GetPage(name: orders, page: () => const pesananPage()),
  ];
}
