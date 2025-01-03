import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;

  const CustomKeyboard({Key? key, required this.onKeyTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 2,
      ),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onKeyTap(keys[index]),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              keys[index],
              style: const TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }
}
