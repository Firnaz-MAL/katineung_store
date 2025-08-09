import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key});

  final List<String> myProductName = ['Pisang Molen', 'Molen Sultan', 'Sebring Balado'];
  final List<String> myProductDes = ['Molen Katineung Pisang',
   'Molen Toping Sultan',
    'Sebrak Kering Balado'];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
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
                color: Colors.grey.shade300,
                blurRadius: 6,
                offset: const Offset(0, 3),
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
                        color: const Color(0xFF4A2E14),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/items/${i + 1}.png',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),

                // Nama produk
                Text(
                  myProductName[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A2E14),
                    fontFamily: 'Merienda',
                  ),
                ),
                const SizedBox(height: 5),

                // Deskripsi
                Text(
                  myProductDes[i],
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4A2E14),
                    fontFamily: 'Merienda',
                  ),
                ),
                const Spacer(),

                // Harga dan ikon keranjang
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '\$65',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A2E14),
                        fontFamily: 'Merienda',
                      ),
                    ),
                    Icon(Icons.shopping_cart, size: 20, color: Color(0xFF4A2E14)),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
