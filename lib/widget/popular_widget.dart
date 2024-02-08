import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  PopularWidget(
      {super.key,
      this.desc,
      this.harga,
      this.rating,
      this.tempat,
      required this.img});

  String? tempat;
  final String img;
  String? desc;
  num? rating;
  int? harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$tempat',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 70),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
              Text(
                '$harga',
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.star),
                  const Icon(Icons.star),
                  const Icon(Icons.star),
                  Text('$rating')
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: Text(
                  '$desc',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
