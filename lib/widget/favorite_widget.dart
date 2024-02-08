// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key, this.tempat, this.rating, this.img, this.nama});

  String? nama;
  String? img;
  String? tempat;
  num? rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('$img'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$nama', style: const TextStyle(color: Colors.white)),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    Text('$tempat',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white),
                    const Icon(Icons.star, color: Colors.white),
                    const Icon(Icons.star, color: Colors.white),
                    const Icon(Icons.star, color: Colors.white),
                    Text(
                      '$rating',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}