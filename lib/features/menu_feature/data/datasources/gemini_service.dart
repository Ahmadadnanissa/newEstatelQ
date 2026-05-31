import 'dart:convert';
import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey =
      "AQ.Ab8RN6JKsfYFXZUThp6NuuO1i4vCcepgA5HRga5vP8z_O-dx-Q";

  static const String _endpoint =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent";

  Future<String> sendMessage(String text) async {
    try {
      final uri = Uri.parse("$_endpoint?key=$apiKey");

      final body = {
        "contents": [
          {
            "role": "user",
            "parts": [
              {
                "text":
                    """
You are EstateIQ AI Assistant.

You are a highly professional real estate consultant integrated into a property application.

Your mission is to help users with:
- Buying, selling, renting properties
- Real estate investment
- Property evaluation and comparisons
- Neighborhood analysis
- Writing property descriptions

Rules:
- Be professional and concise
- Use bullet points when needed
- Never invent property data
- If unsure, say so clearly

User Question:
$text
""",
              },
            ],
          },
        ],
      };

      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode != 200) {
        return "NETWORK_ERROR";
      }

      final data = jsonDecode(response.body);

      final textResponse =
          data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];

      return textResponse ?? "NETWORK_ERROR";
    } catch (_) {
      return "NETWORK_ERROR";
    }
  }

  Future<String> sendConversation(List<ChatMessageModel> messages) async {
    try {
      final uri = Uri.parse("$_endpoint?key=$apiKey");

      final contents = messages.map((msg) {
        return {
          "role": msg.isUser ? "user" : "model",
          "parts": [
            {"text": msg.message},
          ],
        };
      }).toList();

      final body = {"contents": contents};

      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode != 200) {
        return "NETWORK_ERROR";
      }

      final data = jsonDecode(response.body);

      final textResponse =
          data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];

      return textResponse ?? "NETWORK_ERROR";
    } catch (_) {
      return "NETWORK_ERROR";
    }
  }
}
