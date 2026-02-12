import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //list kategori yg diinginkan
    final List<String> categories = ['Molen', 'Sebring', 'Pangsit'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                   ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/categories/${i + 1}.png',
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.fastfood, size: 30, color: Colors.orange),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    categories[i],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: theme.colorScheme.primary,
                      fontFamily: 'Merienda',
                    ),
                  ),
                ],
              ),
            ).animate().slideX(delay: (i * 100).ms, begin: 0.2, end: 0).fadeIn(),
        ],
      ),
    );
  }
}
