import 'package:flutter/material.dart';
// import halaman kamu
import 'package:katineung_store/pages/account_page.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF4A2E14),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Cart',
        style: TextStyle(
          fontFamily: 'Merienda',
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (value) {
            if (value == 'Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            } else if (value == 'Settings') {
              Navigator.pushNamed(context, '/settings');
            } else if (value == 'Help') {
              Navigator.pushNamed(context, '/help');
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(value: 'Profile', child: Text('Profile')),
            const PopupMenuItem(value: 'Settings', child: Text('Settings')),
            const PopupMenuItem(value: 'Help', child: Text('Help')),
          ],
        ),
      ],
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
