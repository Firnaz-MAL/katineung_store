import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late GenerativeModel _model;
  late ChatSession _chat;
  
  // TODO: Replace with a secure way to manage API keys, or ask user to input.
  // For demo purposes, we will use a placeholder that the user must replace.
  static const String _apiKey = 'YOUR_API_KEY_HERE'; 

  GeminiService() {
    if (_apiKey == 'YOUR_API_KEY_HERE') {
      // Placeholder mode: Initialization will be skipped or handled gracefully in sendMessage
      return;
    }
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: _apiKey,
      systemInstruction: Content.text(
        "You are Katineung Store's witty, friendly, and helpful AI assistant. "
        "Your goal is to help customers find products, answer questions about orders, "
        "and chat engagingly about fashion and lifestyle. "
        "Reflect the store's warm and premium brand identity (Brown & Gold theme). "
        "Keep responses concise but charming. Use emojis occasionally."
      ),
    );
    _chat = _model.startChat();
  }

  Future<String> sendMessage(String message) async {
    // Mock Mode if API Key is not set or placeholders are used
    if (_apiKey == 'YOUR_API_KEY_HERE' || _apiKey.isEmpty) {
      await Future.delayed(const Duration(seconds: 1)); // Simulate thinking
      return _getMockResponse(message);
    }
    
    try {
      final response = await _chat.sendMessage(Content.text(message));
      return response.text ?? "Maaf, saya sedang melamun sebentar. Bisa ulangi?";
    } catch (e) {
      // Fallback to mock on error for demo stability
      return _getMockResponse(message);
    }
  }

  String _getMockResponse(String message) {
    message = message.toLowerCase();
    if (message.contains('hallo') || message.contains('hi') || message.contains('pagi')) {
      return "Halo Kak! 👋 Selamat datang di Katineung Store. Mau cari camilan apa hari ini? Ada Molen, Seblak, atau Pangsit nih! 😋";
    } else if (message.contains('rekomendasi') || message.contains('enak')) {
      return "Kalo Kakak suka yang manis, **Molen Sultan** wajib dicoba! Isinya lumer banget. 🍫\n\nTapi kalo lagi pengen yang pedes nampol, **Seblak Kering Balado** juara sih! 🔥";
    } else if (message.contains('harga') || message.contains('berapa')) {
      return "Harganya terjangkau banget kak, mulai dari Rp 15.000 aja! Masih ada promo diskon 58% juga lho hari ini. 💸";
    } else if (message.contains('ongkir') || message.contains('kirim')) {
      return "Kita ada **Gratis Ongkir** ke seluruh Indonesia untuk pembelian di atas 50rb! 🚚💨";
    } else if (message.contains('stok') || message.contains('ada')) {
      return "Stok aman kak! Langsung checkout aja sebelum kehabisan yaa~ 😉";
    } else {
      return "Wah menarik tuh! Cerita lagi dong kak, atau ada yang mau ditanyain soal menu kita? 🤔";
    }
  }
}
