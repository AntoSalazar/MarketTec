import 'package:flutter/material.dart';
import 'package:tecmarketplace/screens/product_screen/product_screen.dart';
import 'package:tecmarketplace/screens/search/search_screen.dart';
import 'package:tecmarketplace/screens/favorites/favorites_screen.dart';
import 'package:tecmarketplace/screens/cart/cart_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyMedium?.color;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
      appBar: AppBar(
        backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
              color: theme.inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              '¿Qué estás buscando?',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark ? Colors.grey[400] : Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Categorías populares",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              CategoryCard(title: 'Electrónica'),
              CategoryCard(title: 'Moda'),
              CategoryCard(title: 'Hogar y Jardín'),
              CategoryCard(title: 'Salud y Belleza'),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Tendencias actuales",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ProductCard(name: 'Producto 1', price: '\$59.99'),
              ProductCard(name: 'Producto 2', price: '\$59.99'),
              ProductCard(name: 'Producto 3', price: '\$59.99', discount: true),
              ProductCard(name: 'Producto 4', price: '\$59.99'),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color;
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor)),
          Text("1200+ artículos", style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final bool discount;
  const ProductCard({super.key, required this.name, required this.price, this.discount = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductPage()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.dividerColor),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border, size: 20, color: Colors.grey.shade600),
            ),
            const Spacer(),
            Text("Categoría", style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
            Text(name, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor)),
            Text(price, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: textColor)),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text("4.0 (24)", style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            )
          ],
        ),
      ),
    );
  }
}
