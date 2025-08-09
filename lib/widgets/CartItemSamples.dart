import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  // Data sementara untuk cart
  List<Map<String, dynamic>> cartItems = List.generate(
    4,
    (i) => {
      "title": "Product Title",
      "price": 55,
      "qty": 1,
      "image": "assets/images/carts/${i + 1}.png",
    },
  );

  // Fungsi tambah quantity
  void increaseQty(int index) {
    setState(() {
      cartItems[index]["qty"]++;
    });
  }

  // Fungsi kurang quantity
  void decreaseQty(int index) {
    setState(() {
      if (cartItems[index]["qty"] > 1) {
        cartItems[index]["qty"]--;
      }
    });
  }

  // Fungsi hapus item (sementara)
  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(cartItems.length, (i) {
        final item = cartItems[i];
        return Container(
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF4A2E14),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Radio(
                value: i,
                groupValue: null,
                activeColor: const Color(0xFF4A2E14),
                onChanged: (value) {},
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item["image"],
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A2E14),
                        fontFamily: 'Merienda',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "\$${item["price"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A2E14),
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Hapus
                  GestureDetector(
                    onTap: () => removeItem(i),
                    child: const Icon(Icons.delete, color: Colors.red),
                  ),
                  Row(
                    children: [
                      // Tombol Kurang
                      GestureDetector(
                        onTap: () => decreaseQty(i),
                        child: _buildQtyButton(Icons.remove),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "${item["qty"].toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A2E14),
                            fontFamily: 'Merienda',
                          ),
                        ),
                      ),
                      // Tombol Tambah
                      GestureDetector(
                        onTap: () => increaseQty(i),
                        child: _buildQtyButton(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildQtyButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 18, color: const Color(0xFF4A2E14)),
    );
  }
}


