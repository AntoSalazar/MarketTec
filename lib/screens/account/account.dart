import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_provider.dart';
import '../login/login.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyMedium?.color;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
      appBar: AppBar(
        backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.1),
        iconTheme: theme.iconTheme,
        title: Text("Cuenta", style: theme.textTheme.titleLarge?.copyWith(color: textColor)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/vendedor_avatar.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("James", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text("james@tec.com", style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text("Mis compras"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Historial"),
            onTap: () {},
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          ListTile(
            leading: const Icon(Icons.storefront),
            title: const Text("Vender"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text("Publicaciones"),
            onTap: () {},
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          ListTile(
            leading: Icon(Icons.accessibility_new, color: textColor),
            title: const Text("Accesibilidad"),
            subtitle: const Text("Preferencias de tema"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AccessibilitySettings()),
              );
            },
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text("Cerrar sesión"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AccessibilitySettings extends StatelessWidget {
  const AccessibilitySettings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
      appBar: AppBar(
        backgroundColor: isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFFFBF0),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        iconTheme: theme.iconTheme,
        title: Text("Accesibilidad", style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tema", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Seguir tema del sistema"),
              value: themeProvider.followSystem,
              onChanged: (value) => themeProvider.toggleFollowSystem(value),
            ),
            if (!themeProvider.followSystem)
              SwitchListTile(
                title: const Text("Modo oscuro"),
                value: isDark,
                onChanged: (value) => themeProvider.toggleTheme(value),
              ),
          ],
        ),
      ),
    );
  }
}
