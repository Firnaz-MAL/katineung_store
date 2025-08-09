import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});

  final List<Map<String, String>> chats = [
    {
      'name': 'Nike Official',
      'message': 'Segera Memesan Sebelum Kehabisan.',
      'time': '12:30',
      'avatar': 'images/chats/1.png',
    },
    {
      'name': 'Expander',
      'message': 'Hallo, Selamat Datang Di Nike Official.',
      'time': '12:05',
      'avatar': 'images/chats/2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9C96A), // 🍯 Background kuning
      appBar: AppBar(
        title: const Text(
          'List Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF4A2E14), // 🍫 Warna coklat
            fontFamily: 'Merienda',
          ),
        ),
        backgroundColor: const Color(0xFFF9C96A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF4A2E14)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Semua',
                      style: TextStyle(
                        color: Color(0xFF4A2E14),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Belum Dibaca',
                      style: TextStyle(
                        color: Color(0xFF4A2E14),
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "ChatDetail");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(chat['avatar']!),
                            radius: 25,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF4A2E14),
                                    fontFamily: 'Merienda',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  chat['message']!,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Merienda',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                chat['time']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'Merienda',
                                ),
                              ),
                              if (index == 0)
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Merienda',
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
