import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyMedium?.color;

    // Simulación de datos del carrito
    final List<Map<String, dynamic>> cartItems = [
      {'name': 'Banderillas', 'price': 25.0, 'qty': 2},
      {'name': 'Playeras', 'price': 100.0, 'qty': 1},
    ];

    // Calcular el total
    final double total = cartItems.fold(0.0, (sum, item) {
      final price = item['price'] as double;
      final qty = item['qty'] as int;
      return sum + price * qty;
    });

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
      appBar: AppBar(
        backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
        elevation: 2,
        title: Text("Carrito", style: theme.textTheme.titleLarge?.copyWith(color: textColor)),
        iconTheme: theme.iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: Text(item['name'] as String, style: theme.textTheme.bodyMedium),
                    subtitle: Text("Cantidad: ${item['qty']}", style: theme.textTheme.bodySmall),
                    trailing: Text("\$${(item['price'] as double).toStringAsFixed(2)}", style: theme.textTheme.bodyMedium),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: theme.textTheme.titleMedium),
                Text("\$${total.toStringAsFixed(2)}", style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E6144),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Proceder al pago", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
