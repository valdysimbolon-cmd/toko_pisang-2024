import 'package:flutter/material.dart';

/// Nomor WhatsApp tujuan order (format internasional, tanpa + dan tanpa 0 di depan).
/// GANTI dengan nomor Anda.
const waNumber = '6281271768461';

/// 250000 -> "Rp.250.000,00"
String rp(int v) {
  final s = v
      .toString()
      .replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  return 'Rp.$s,00';
}

class Product {
  final String name, category, image, emoji;
  final int price;
  final Color color; // warna latar placeholder jika gambar belum ada
  const Product(
      this.name, this.category, this.price, this.image, this.emoji, this.color);
}

const filters = ['All', 'Living Room', 'Bedroom', 'Dining Room'];

// Harga bebas ditentukan sendiri (sesuai soal)
const products = [
  Product('Stylish Chair', 'Living Room', 170000, 'assets/images/chair.jpg',
      '🪑', Color(0xFFD7CCC8)),
  Product('Modern Table', 'Dining Room', 750000, 'assets/images/table.jpg',
      '🍽️', Color(0xFFBCAAA4)),
  Product('Wooden Console', 'Living Room', 250000, 'assets/images/console.jpg',
      '🎮', Color(0xFFFFD54F)),
  Product('Brown Armchair', 'Living Room', 210000,
      'assets/images/armchair.jpg', '🛋️', Color(0xFFCFD8DC)),
  Product('Comfy Bed', 'Bedroom', 1200000, 'assets/images/bed.jpg', '🛏️',
      Color(0xFFE1BEE7)),
];
