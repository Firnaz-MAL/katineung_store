import 'package:flutter/material.dart';
import 'package:katineung_store/services/gemini_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({super.key, required this.contactName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GeminiService _geminiService = GeminiService();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  List<Map<String, dynamic>> messages = [
    {'text': 'Hallo! Selamat datang di Katineung Store. Ada yang bisa saya bantu hari ini?', 'isMe': false, 'time': DateFormat('HH:mm').format(DateTime.now())},
  ];
  
  bool _isTyping = false;

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      String userMessage = _controller.text;
      setState(() {
        messages.add({
          'text': userMessage,
          'isMe': true,
          'time': _formatCurrentTime(),
        });
        _isTyping = true;
      });
      _controller.clear();
      _scrollToBottom();

      // Get AI Response
      String response = await _geminiService.sendMessage(userMessage);

      if (mounted) {
        setState(() {
          _isTyping = false;
          messages.add({
            'text': response,
            'isMe': false,
            'time': _formatCurrentTime(),
          });
        });
        _scrollToBottom();
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _formatCurrentTime() {
    return DateFormat('HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Row(
          children: [
             CircleAvatar(
               backgroundColor: theme.colorScheme.primary,
               child: const Icon(Icons.person, color: Colors.white),
             ),
             const SizedBox(width: 10),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                  widget.contactName,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merienda',
                    fontSize: 18,
                  ),
                ),
                 Text(
                   "Online",
                   style: TextStyle(fontSize: 12, color: theme.colorScheme.primary.withOpacity(0.7)),
                 )
               ],
             ),
          ],
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.primary),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  itemCount: messages.length + (_isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == messages.length && _isTyping) {
                      return Padding(
                         padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Container(
                             padding: const EdgeInsets.all(12),
                             decoration: BoxDecoration(
                               color: theme.colorScheme.surface,
                               borderRadius: const BorderRadius.only(
                                 topLeft: Radius.circular(16),
                                 topRight: Radius.circular(16),
                                 bottomRight: Radius.circular(16),
                               ),
                             ),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 const Text("Sedang mengetik"),
                                 const SizedBox(width: 4),
                                 ...List.generate(3, (i) => Padding(
                                   padding: const EdgeInsets.all(1),
                                   child: const CircleAvatar(radius: 2, backgroundColor: Colors.grey).animate(onPlay: (c) => c.repeat()).scale(delay: (i * 200).ms, duration: 600.ms),
                                 ))
                               ],
                             ),
                           ),
                         ),
                      );
                    }
                    
                    final message = messages[index];
                    final isMe = message['isMe'];
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      child: Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: isMe ? theme.colorScheme.primary : theme.colorScheme.surface,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20),
                                  bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
                                  bottomRight: isMe ? Radius.zero : const Radius.circular(20),
                                ),
                                boxShadow: [
                                   BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))
                                ],
                              ),
                              child: Text(
                                message['text'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isMe ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
                                  fontFamily: 'Merienda',
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message['time'],
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontFamily: 'Merienda',
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2, end: 0),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: theme.colorScheme.background,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                         BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(fontFamily: 'Merienda'),
                      decoration: const InputDecoration(
                        hintText: 'Ketik pesan...',
                        hintStyle: TextStyle(fontFamily: 'Merienda'),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                     boxShadow: [
                         BoxShadow(color: theme.colorScheme.primary.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4)),
                      ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
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
