import 'package:flutter/material.dart';
import '../data/products.dart';
import 'product_image.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ProductImage(product: p)),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(rp(p.price),
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (_) => const Icon(Icons.star,
                              size: 12, color: Colors.orange)),
                      const Spacer(),
                      InkWell(
                        onTap: () => setState(() => fav = !fav),
                        child: Icon(
                          fav ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: fav ? Colors.red : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
