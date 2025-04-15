import 'package:flutter/material.dart';
import 'package:tecmarketplace/screens/product_screen/product_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allItems = [
    'Banderillas',
    'Playeras',
    'Audífonos',
    'Celular',
    'Tenis',
    'Cargador',
    'Cámara',
  ];

  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = [];
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredItems = _allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyMedium?.color;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
      appBar: AppBar(
        backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        surfaceTintColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: 'Buscar productos...',
            hintStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[700]),
            fillColor: theme.inputDecorationTheme.fillColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _searchController.text.isEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sugerencias", style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _allItems.take(6).map((item) => Chip(label: Text(item))).toList(),
            )
          ],
        )
            : _filteredItems.isEmpty
            ? Center(child: Text("No se encontraron resultados.", style: theme.textTheme.bodyMedium))
            : ListView.builder(
          itemCount: _filteredItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_filteredItems[index], style: theme.textTheme.bodyMedium),
              onTap: () {
                // Navigate to product details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(productName: _filteredItems[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
