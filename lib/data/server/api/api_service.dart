import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:rttrm_task_app/domain/data/ownership/ownership_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Logger _logger = Logger(); // Logger obyektini yaratamiz

  Future<List<OwnershipData>> getOwnership() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/university/ownership");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => OwnershipData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }
}
