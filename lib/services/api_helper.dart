import 'dart:convert';

import 'package:http/http.dart' as http;

class Helper {
  static Future<Map<String, String?>?> getDuaa() async {
    http.Response response = await http
        .get(Uri.parse("https://azkar-api.nawafhq.repl.co/zekr?json=true"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String duaa = data["content"];
      String description = data["description"];
      return {
        "duaa": duaa,
        "description": description.isEmpty ? null : description
      };
    }

    return null;
  }

  static Future<Map<String, String?>?> getDuaaByType(String zekrType) async {
    http.Response response = await http.get(Uri.parse(
        "https://azkar-api.nawafhq.repl.co/zekr?json=true&$zekrType=true"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String duaa = data["content"];
      String description = data["description"];

      return {
        "duaa": duaa,
        "description": description.isEmpty ? null : description
      };
    }

    return null;
  }
}
