import 'package:flutter/material.dart';
import 'pages/register_page.dart';

void main() => runApp(const TokoPisangApp());

class TokoPisangApp extends StatelessWidget {
  const TokoPisangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Pisang',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RegisterPage(),
    );
  }
}
