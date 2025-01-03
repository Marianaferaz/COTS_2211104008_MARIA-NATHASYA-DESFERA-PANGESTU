import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Pesanan",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem("Riwayat", true),
                _buildTabItem("Dalam proses", false),
                _buildTabItem("Terjadwal", false),
              ],
            ),
          ),
          const Divider(height: 1),

          // Filter Chips
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildFilterChip("GoFood", true),
                const SizedBox(width: 8),
                _buildDropdownButton("Status"),
              ],
            ),
          ),

          // GoPay Transactions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.account_balance_wallet, color: Colors.blue[700]),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Transaksi Gopay",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Order List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 3, // Jumlah pesanan
              itemBuilder: (context, index) {
                return _buildOrderCard(
                  "Ayam Benjoss, kedungkandang",
                  "3 item\n2 Paket Ayam Bakar Jumbo",
                  "Makanan sudah diantar\n28 Des 11.36",
                  "Rp58.800",
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Index untuk tab "Orders"
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Promos"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, bool isSelected) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.green : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        if (isSelected)
          Container(
            width: 40,
            height: 2,
            color: Colors.green,
          ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
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

  Widget _buildDropdownButton(String label) {
    return DropdownButton<String>(
      value: label,
      underline: Container(),
      items: [
        DropdownMenuItem(
          value: label,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        // Tambahkan opsi lainnya sesuai kebutuhan
      ],
      onChanged: (value) {},
      icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
    );
  }

  Widget _buildOrderCard(String title, String details, String status, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.restaurant, color: Colors.red),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text(
                  "Pesan lagi",
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
