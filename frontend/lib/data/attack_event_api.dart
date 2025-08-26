import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/attack_event.dart';

class AttackEventApi {
  final String baseUrl;

  AttackEventApi(this.baseUrl);

  Future<AttackEvent?> fetchNextEvent() async {
    final response = await http.get(Uri.parse('$baseUrl/next_event'));
    if (response.statusCode == 200) {
      return AttackEvent.fromJson(json.decode(response.body));
    }
    return null;
  }
}