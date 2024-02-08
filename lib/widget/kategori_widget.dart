import 'package:flutter/material.dart';

class KategoriWidget extends StatelessWidget {
  const KategoriWidget({super.key, required this.name, required this.text});
  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Image.asset(name),
            const SizedBox(width: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
}
