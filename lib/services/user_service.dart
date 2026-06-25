import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final http.Client client;

  UserService(this.client);

  Future<String> getUserName(int id) async {
    final response = await client.get(
      Uri.parse('https://api.example.com/users/$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name'];
    } else {
      throw Exception('Failed to load user');
    }
  }
}
