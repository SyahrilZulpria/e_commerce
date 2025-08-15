import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              product["image"],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product["title"],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          product["subtitle"],
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product["price"]}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                Text(
                  product["rating"].toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
