import 'package:flutter/material.dart';
import '../data/products.dart';

/// Menampilkan gambar produk dari assets.
/// Jika file gambar belum ada, tampil placeholder emoji (aplikasi tidak error).
class ProductImage extends StatelessWidget {
  final Product product;
  final double? height;
  const ProductImage({super.key, required this.product, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      height: height,
      width: double.infinity,
      child: Image.asset(
        product.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stack) => Center(
          child: Text(product.emoji, style: const TextStyle(fontSize: 56)),
        ),
      ),
    );
  }
}
