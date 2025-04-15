import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  int _currentImage = 0;

  final List<String> imageList = [
    'assets/images/Banderillas.jpg',
    'assets/images/Banderillas2.jpg',
    'assets/images/Banderillas3.jpg',
  ];

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Banderillas se agregó al carrito')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color;
    final cardColor = theme.cardColor;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Detalles del Producto', style: theme.appBarTheme.titleTextStyle),
        centerTitle: true,
        iconTheme: theme.appBarTheme.iconTheme,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 220,
                child: PageView.builder(
                  itemCount: imageList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imageList[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageList.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImage == index
                        ? theme.colorScheme.primary
                        : Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Text('Banderillas', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/vendedor_avatar.png'),
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Text('James Hernández', style: theme.textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Carrera: Ingeniería en Sistemas Computacionales\nSemestre: Séptimo\nTurno: Matutino',
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text('Precio: \$25.00 MXN', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle, color: theme.iconTheme.color),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text('$quantity', style: theme.textTheme.titleMedium),
                    IconButton(
                      icon: Icon(Icons.add_circle, color: theme.iconTheme.color),
                      onPressed: () {
                        setState(() {
                          if (quantity < 10) quantity++;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Agregar al carrito', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            const SizedBox(height: 24),
            Text('Descripción', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'Deliciosas banderillas de salchicha empanizadas, crujientes y doradas. Perfectas para un snack o antojo callejero.',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
