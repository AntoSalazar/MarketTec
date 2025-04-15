import 'package:flutter/material.dart';
import 'package:tecmarketplace/theme/app_constants.dart';
import 'package:tecmarketplace/screens/product_screen/product_screen.dart';
import 'package:tecmarketplace/screens/search/search_screen.dart';
import 'package:tecmarketplace/screens/favorites/favorites_screen.dart';
import 'package:tecmarketplace/screens/cart/cart_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final Set<int> _favoriteIndexes = {};
  late final PageController _pageController;

  final List<String> tendenciasImages = [
    'assets/images/halo5.jpg',
    'assets/images/tendencias.jpg',
    'assets/images/spotify.jpg',
    'assets/images/titan.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.98);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark ? theme.scaffoldBackgroundColor : kLightBackgroundColor;

    final List<Map<String, String>> categories = [
      {'title': 'Electrónica', 'image': 'assets/images/electronica.jpg'},
      {'title': 'Moda', 'image': 'assets/images/moda.jpg'},
      {'title': 'Hogar y Jardín', 'image': 'assets/images/hogar_jardin.jpg'},
      {'title': 'Salud y Belleza', 'image': 'assets/images/categoria4.jpg'},
    ];

    final List<Map<String, dynamic>> products = [
      {
        'name': 'Producto 1',
        'price': '\$59.99',
        'discount': false,
        'category': 'Electrónica',
        'rating': 4.0,
        'reviews': 24,
        'image': 'assets/images/Banderillas.jpg',
      },
      {
        'name': 'Producto 2',
        'price': '\$59.99',
        'discount': true,
        'category': 'Moda',
        'rating': 4.5,
        'reviews': 18,
        'image': 'assets/images/Banderillas3.jpg',
      },
      {
        'name': 'Producto 3',
        'price': '\$39.99',
        'discount': false,
        'category': 'Hogar y Jardín',
        'rating': 3.8,
        'reviews': 10,
        'image': 'assets/images/spotify.jpg',
      },
      {
        'name': 'Producto 4',
        'price': '\$99.99',
        'discount': true,
        'category': 'Electrónica',
        'rating': 4.9,
        'reviews': 45,
        'image': 'assets/images/brownies.jpg',
      },
      {
        'name': 'Producto 5',
        'price': '\$24.99',
        'discount': false,
        'category': 'Salud y Belleza',
        'rating': 4.2,
        'reviews': 15,
        'image': 'assets/images/youtube.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Buscar productos...',
              style: TextStyle(color: isDark ? Colors.white70 : Colors.black54, fontSize: 14),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: textColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Categorías destacadas',
              style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Image.asset(category['image']!, width: 240, fit: BoxFit.cover),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            category['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tendencias',
              style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 17),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: tendenciasImages.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = (_pageController.page! - index).abs();
                      value = (1 - (value * 0.2)).clamp(0.9, 1.0);
                    }
                    return Transform.scale(
                      scale: Curves.easeOut.transform(value),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(19),
                          child: Image.asset(
                            tendenciasImages[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: products.asMap().entries.map((entry) {
              final index = entry.key;
              final product = entry.value;
              final isFavorite = _favoriteIndexes.contains(index);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProductPage(productName: product['name'])),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[900] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            child: Image.asset(
                              product['image'],
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product['name'],
                                      style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text(product['price'],
                                      style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 14)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${product['rating']} (${product['reviews']})",
                                        style: TextStyle(color: textColor.withOpacity(0.6), fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  if (product['discount'])
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text('Descuento',
                                          style: TextStyle(color: Colors.white, fontSize: 10)),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isFavorite) {
                                _favoriteIndexes.remove(index);
                              } else {
                                _favoriteIndexes.add(index);
                              }
                            });
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
