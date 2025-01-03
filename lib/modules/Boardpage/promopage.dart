import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Promo",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // XP Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/xp_icon.png', // Ganti dengan path ikon XP
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "121 XP to your next treasure",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: 0.6, // Sesuaikan progress
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),

            // Voucher, Subscription, and Mission Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard("13", "Vouchers", Colors.orange),
                  _buildInfoCard("0", "Langganan", Colors.purple),
                  _buildInfoCard("0", "Mission", Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Promo Code Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Masukan kode promo",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Promo Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  _buildPromoCategory("Apa aja", true),
                  _buildPromoCategory("GoFood", false),
                  _buildPromoCategory("GoPay", false),
                  _buildPromoCategory("GoPayLater", false),
                  _buildPromoCategory("GoRide", false),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Promo Highlights
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Biar makin hemat",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildPromoCard('assets/gofood_promo.png', "GoFood"),
                  _buildPromoCard('assets/gofood_promo.png', "GoFood"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Popular Brand Promo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.local_offer, color: Colors.green),
                  const SizedBox(width: 8),
                  const Text(
                    "Promo menarik dari brand populer",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Buat rileks atau produktif, kamu yang tentuin!",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
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

  Widget _buildInfoCard(String count, String label, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPromoCategory(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {},
      selectedColor: Colors.green,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.green,
        fontSize: 14,
      ),
      backgroundColor: Colors.green[50],
    );
  }

  Widget _buildPromoCard(String imagePath, String label) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 80,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
