import 'package:flutter/material.dart';
import 'package:katineung_store/pages/account_page.dart';
import 'package:katineung_store/pages/cart_page.dart';
import 'package:katineung_store/widgets/CategoriesWidget.dart';
import 'package:katineung_store/widgets/ItemsWidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Handle navigation via bottom bar
        children: const [
          HomePageContent(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 70,
        color: theme.colorScheme.primary,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.account_circle_sharp, size: 30, color: Colors.white),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            backgroundColor: theme.colorScheme.background,
            floating: true,
            title: Text(
              'Katineung Store',
              style: TextStyle(
                fontFamily: 'Merienda',
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
                fontSize: 24,
              ),
            ),
            actions: [
               Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: badges.Badge(
                  badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
                  badgeContent: const Text('9', style: TextStyle(color: Colors.white)),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, 'ListChat'),
                    child: Icon(Icons.message_rounded, color: theme.colorScheme.primary, size: 28),
                  ),
                ),
              ),
            ],
          ),
          
           // Hero Banner & Search
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Glassmorphism Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari barang impianmu...",
                        hintStyle: TextStyle(color: Colors.grey[600], fontFamily: 'Merienda'),
                        prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
                        suffixIcon: Icon(Icons.camera_alt, color: theme.colorScheme.primary),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 20),

                  // Hero Banner Carousel
                  SizedBox(
                    height: 180,
                    child: PageView(
                      children: [
                        _buildBannerItem(theme, "Diskon Spesial", "Belanja hemat hari ini!", Colors.orange.shade100),
                        _buildBannerItem(theme, "Koleksi Baru", "Tampil gaya dengan koleksi terbaru.", Colors.blue.shade100),
                        _buildBannerItem(theme, "Gratis Ongkir", "Ke seluruh Indonesia.", Colors.green.shade100),
                      ],
                    ),
                  ).animate().fadeIn(delay: 200.ms).scale(),

                  const SizedBox(height: 25),

                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                      fontFamily: 'Merienda',
                    ),
                  ).animate().fadeIn(delay: 300.ms),
                  
                  const SizedBox(height: 10),
                  const CategoriesWidget(),
                  
                  const SizedBox(height: 25),
                  
                  Text(
                    'Best Selling',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                      fontFamily: 'Merienda',
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  
                  const SizedBox(height: 10),
                  ItemsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerItem(ThemeData theme, String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(Icons.shopping_bag, size: 150, color: Colors.white.withOpacity(0.3)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontFamily: 'Merienda',
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.colorScheme.primary.withOpacity(0.8),
                    fontFamily: 'Merienda',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
