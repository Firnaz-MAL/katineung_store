import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/account_page.dart';
import 'pages/changepassword_page.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/list_chat.dart';
import 'pages/detail_chat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Login',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Merienda',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A2E14),
          primary: const Color(0xFF4A2E14),
          secondary: const Color(0xFFF9C96A),
          surface: const Color(0xFFFFF8E7), // Lighter background for surface
          background: const Color(0xFFF9C96A),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9C96A),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A2E14),
            foregroundColor: const Color(0xFFF9C96A),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF4A2E14), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/account': (context) => const AccountPage(),
        '/changePassword': (context) => const ChangepasswordPage(),
        '/cart': (context) => const CartPage(),
        'ListChat': (context) => ChatListPage(),
        'ChatDetail': (context) => ChatScreen(contactName: 'Nike Official'),
        '/': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(), // dummy
        '/help': (context) => const HelpPage(), // dummy
        '/notifications': (context) => const NotificationsPage(), // dummy
      },
    );
  }
}

// Dummy Settings Page
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: const Center(child: Text("Notivikasi aplikasi di sini")),
    );
  }
}

// Dummy Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(child: Text("Pengaturan aplikasi di sini")),
    );
  }
}

// Dummy Help Page
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help")),
      body: const Center(child: Text("Bantuan aplikasi di sini")),
    );
  }
}
