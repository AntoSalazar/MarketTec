import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/register/register_screen1.dart'; // Import registration screen
import 'screens/login/login_screen.dart'; // Import login screen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style for status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketTec',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0288D1), // Match the blue in your design
          primary: const Color(0xFF0288D1),
        ),
        fontFamily: 'Roboto', // Optional: Set a default font
        useMaterial3: true, // Enable Material 3 design
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
        ),
      ),
      initialRoute: '/login', // Set initial route to login screen
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen1(),
      },
    );
  }
}
