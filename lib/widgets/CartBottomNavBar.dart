import 'package:flutter/material.dart';

class CartBottomNavBar extends StatefulWidget {
  const CartBottomNavBar({super.key});

  @override
  State<CartBottomNavBar> createState() => _CartBottomNavBarState();
}

class _CartBottomNavBarState extends State<CartBottomNavBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushNamed(context, '/account');
        break;
    }
  }

  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9C96A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Confirm Checkout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Merienda',
            ),
          ),
          content: const Text(
            'Are you sure you want to proceed with checkout?',
            style: TextStyle(fontFamily: 'Merienda'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: const Text(
                    'Checkout Successful',
                    style: TextStyle(fontFamily: 'Merienda'),
                  ),),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A2E14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Merienda',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            color: const Color(0xFFF9C96A),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Total:',
                      style: TextStyle(
                        color: Color(0xFF4A2E14),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merienda',
                      ),
                    ),
                    Text(
                      '\$29.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF4A2E14),
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _showCheckoutDialog,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A2E14),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Check Out',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // BottomNavigationBar(
          //   currentIndex: _selectedIndex,
          //   onTap: _onItemTapped,
          //   backgroundColor: const Color(0xFF4A2E14),
          //   selectedItemColor: Colors.white,
          //   unselectedItemColor: Colors.white54,
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          //   ],
          //   selectedLabelStyle: const TextStyle(fontFamily: 'Merienda'),
          //   unselectedLabelStyle: const TextStyle(fontFamily: 'Merienda'),
          // ),
        ],
      ),
    );
  }
}
