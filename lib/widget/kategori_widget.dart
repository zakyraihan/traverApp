import 'package:flutter/material.dart';
import 'package:travel_app/common/styles.dart';

class KategoriWidget extends StatelessWidget {
  const KategoriWidget({super.key, required this.name, required this.img});
  final String name;
  final String img;

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
            Image.network(img),
            const SizedBox(width: 5),
            Text(
              name,
              style: style(Colors.black, FontWeight.w500, 16),
            ),
          ],
        ),
      ),
    );
  }
}
