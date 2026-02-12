import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key});

  final List<String> myProductName = ['Pisang Molen', 'Molen Sultan', 'Sebring Balado'];
  final List<String> myProductDes = ['Molen Katineung Pisang',
   'Molen Toping Sultan',
    'Sebrak Kering Balado'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(myProductName.length, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Diskon dan ikon favorit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        '-58%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Merienda',
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite_border, color: Colors.red),
                  ],
                ),
                const SizedBox(height: 10),

                // Gambar produk
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/items/${i + 1}.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                        Container(color: Colors.grey[200], child: Icon(Icons.image_not_supported, color: Colors.grey)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Nama produk
                Text(
                  myProductName[i],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontFamily: 'Merienda',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),

                // Deskripsi
                Text(
                  myProductDes[i],
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.primary.withOpacity(0.7),
                    fontFamily: 'Merienda',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Harga dan ikon keranjang
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$65',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                        fontFamily: 'Merienda',
                      ),
                    ),
                    Icon(Icons.shopping_cart_outlined, size: 24, color: theme.colorScheme.primary),
                  ],
                ),
              ],
            ),
          ),
        ).animate().fadeIn(delay: (i * 100).ms).slideY(begin: 0.1, end: 0);
      }),
    );
  }
}
