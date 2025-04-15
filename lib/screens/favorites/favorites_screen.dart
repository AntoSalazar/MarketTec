import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
        shadowColor: Colors.black.withOpacity(0.1),
        surfaceTintColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        title: Text(
          "Favoritos",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tus productos favoritos aparecerán aquí",
                style: theme.textTheme.bodyMedium?.copyWith(color: textColor)),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(0, (index) {
                  // Reemplazar con productos favoritos reales cuando se implemente lógica
                  return Container();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
