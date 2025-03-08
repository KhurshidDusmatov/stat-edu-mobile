import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:rttrm_task_app/domain/data/edutype/edu_type_response_data.dart';
import 'package:rttrm_task_app/domain/data/gender/gender_response_data.dart';
import 'package:rttrm_task_app/domain/data/ownership/ownership_data.dart';
import 'package:http/http.dart' as http;
import 'package:rttrm_task_app/domain/data/paymentType/payment_type_response_data.dart';

class ApiService {
  final Logger _logger = Logger();

  Future<List<ResponseData>> getOwnership() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/university/ownership");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => ResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }

  Future<List<ResponseData>> getUniversityType() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/university/universityType");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => ResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }

  Future<List<ResponseData>> getUniversityRegion() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/university/region");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => ResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }

  Future<List<EduTypeResponseData>> getOwnershipAndEduType() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/student/ownershipAndEduType");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => EduTypeResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }

  Future<List<GenderResponseData>> getOwnershipAndGender() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/student/ownershipAndGender");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => GenderResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }

  Future<List<PaymentTypeResponseData>> getOwnershipAndPaymentType() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/student/ownershipAndPaymentType");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => PaymentTypeResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }



  Future<List<GenderResponseData>> getTeacherOwnershipAndGender() async {
    try {
      final url = Uri.parse("https://stat.edu.uz/api/statistic/common/teacher/ownershipAndGender");
      _logger.i("Request: GET $url");

      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      _logger.i("Response (${response.statusCode}): ${utf8.decode(response.bodyBytes)}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        return data.map((item) => GenderResponseData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e("API Request Error: $e");
      return [];
    }
  }




}
