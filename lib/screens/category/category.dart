import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Categorías",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Aquí irán todas las categorías 🛒',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
