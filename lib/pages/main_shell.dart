import 'package:flutter/material.dart';
import '../data/products.dart';
import '../widgets/app_nav.dart';
import '../widgets/product_card.dart';
import 'detail_page.dart';

class MainShell extends StatefulWidget {
  final String storeName;
  const MainShell({super.key, required this.storeName});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _tab = 0;
  String _filter = 'All';

  static const _tabLabels = ['Home', 'Pencarian', 'Keranjang', 'Profil'];

  Widget _home() {
    final list = products
        .where((p) => _filter == 'All' || p.category == _filter)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(widget.storeName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final selected = _filter == filters[i];
              return ChoiceChip(
                label: Text(filters[i]),
                selected: selected,
                showCheckmark: false,
                selectedColor: Colors.black,
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: selected ? Colors.white : Colors.black),
                onSelected: (_) => setState(() => _filter = filters[i]),
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemCount: list.length,
            itemBuilder: (context, i) => ProductCard(
              product: list[i],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailPage(product: list[i])),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListTile(
            leading: const Icon(Icons.store),
            title: Text(widget.storeName),
          ),
        ),
      ),
      body: _tab == 0
          ? _home()
          : Center(child: Text('Halaman ${_tabLabels[_tab]}')),
      bottomNavigationBar:
          AppNav(index: _tab, onTap: (i) => setState(() => _tab = i)),
    );
  }
}
