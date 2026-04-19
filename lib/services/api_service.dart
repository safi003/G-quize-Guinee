import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/question.dart';

class ApiService {

  // 🔹 GET
  static Future<List<Question>> getQuestions() async {
    final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/questions/')
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Question.fromJson(e)).toList();
    } else {
      throw Exception('Erreur');
    }
  }

  // 🔹 POST
  static Future<void> createTask(String title) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/tasks/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title}),
    );

    if (response.statusCode != 201) {
      throw Exception('Erreur POST');
    }
  }

  // 🔹 DELETE
  static Future<void> deleteTask(int id) async {
    final response = await http.delete(
        Uri.parse('${ApiConfig.baseUrl}/tasks/$id/')
    );

    if (response.statusCode != 204) {
      throw Exception('Erreur DELETE');
    }
  }
}