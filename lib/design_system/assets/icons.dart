import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Atomis Icon Collections'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Icon',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Source Icon : Link',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Varian'),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(40, (index) => const IconBox(icon: Icons.ac_unit)),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Feature'),
              Wrap(
                spacing: 8,
                children: List.generate(20, (index) => const CircleFeatureBox(icon: Icons.star)),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Bar'),
              Wrap(
                spacing: 12,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBox(icon: Icons.home),
                      IconBox(icon: Icons.settings),
                      IconBox(icon: Icons.chat),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconBox(icon: Icons.add),
                      IconBox(icon: Icons.arrow_upward),
                      IconBox(icon: Icons.send),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  final IconData icon;

  const IconBox({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.green),
    );
  }
}

class CircleFeatureBox extends StatelessWidget {
  final IconData icon;

  const CircleFeatureBox({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
