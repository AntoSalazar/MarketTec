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

    final List<Map<String, String>> categories = [
      {'title': 'Electrónica', 'count': '1200+'},
      {'title': 'Moda', 'count': '950+'},
      {'title': 'Hogar y Jardín', 'count': '820+'},
      {'title': 'Salud y Belleza', 'count': '750+'},
    ];

    final List<Map<String, dynamic>> products = [
      {
        'name': 'Producto 1',
        'price': '\$59.99',
        'discount': false,
        'category': 'Electrónica',
        'rating': 4.0,
        'reviews': 24
      },
      {
        'name': 'Producto 2',
        'price': '\$59.99',
        'discount': false,
        'category': 'Moda',
        'rating': 4.5,
        'reviews': 18
      },
      {
        'name': 'Producto 3',
        'price': '\$59.99',
        'discount': true,
        'category': 'Hogar',
        'rating': 3.5,
        'reviews': 32
      },
      {
        'name': 'Producto 4',
        'price': '\$59.99',
        'discount': false,
        'category': 'Salud',
        'rating': 5.0,
        'reviews': 7
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: isDark ? theme.scaffoldBackgroundColor : theme.colorScheme.background,
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
            children: categories.map((category) => CategoryCard(
              title: category['title']!,
              articleCount: category['count']!,
            )).toList(),
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
            children: products.map((product) => ProductCard(
              name: product['name'],
              price: product['price'],
              category: product['category'],
              rating: product['rating'],
              reviews: product['reviews'],
              discount: product['discount'],
              onFavoriteToggle: () {},
            )).toList(),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String articleCount;
  const CategoryCard({super.key, required this.title, required this.articleCount});

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
          Text("$articleCount artículos", style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final bool discount;
  final String category;
  final double rating;
  final int reviews;
  final VoidCallback? onFavoriteToggle;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    this.discount = false,
    this.category = 'Categoría',
    this.rating = 4.0,
    this.reviews = 24,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductPage(productName: name)),
        );
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
              child: GestureDetector(
                onTap: onFavoriteToggle,
                child: Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Colors.grey.shade600,
                  semanticLabel: 'Toggle favorite',
                ),
              ),
            ),
            if (discount)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Oferta',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            const Spacer(),
            Text(category, style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
            Text(name, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor)),
            Text(price, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: textColor)),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  "$rating ($reviews)",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
