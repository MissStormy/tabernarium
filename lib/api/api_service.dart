import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tabernarium/models/game.dart';


class ApiService {
  static Future<List<Game>> fetchGames() async {
    final response = await http.get(Uri.parse('https://tu-api.com/games'));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((gameJson) => Game.fromJson(gameJson)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }

  // Otras funciones de la API aquí...
}
