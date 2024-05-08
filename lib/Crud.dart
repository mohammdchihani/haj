import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud {
  Future<dynamic> postRequest(String url, Map<String, dynamic> data) async {
    try {
      print(jsonEncode(data));
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      print(response.reasonPhrase);

      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful request, return response body
        return jsonDecode(response.body);
      } else {
        // Handle HTTP error
        throw Exception('Failed to perform action: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network error
      throw Exception('Failed to perform action: $e');
    }
  }

  Future<dynamic> getRequest(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("statusCode ${url}: ${response.statusCode}");
      if (response.statusCode == 200) {
        // Decode response body
        final decodedBody = utf8.decode(response.bodyBytes);
        // Debugging: print decoded body
        print(decodedBody);
        // Successful request, return response body
        return jsonDecode(decodedBody);
      } else {
        // Handle HTTP error
        throw Exception('Failed to perform action: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network error
      throw Exception('Failed to perform action: $e');
    }
  }



  Future<List<dynamic>> deleteoneairport(String airportId ) async {
    try {

      final response = await http.delete(
        Uri.parse('https://el-haj-4q9u.vercel.app/api/airport?id=${airportId}'),
        headers: {
          'Content-Type': 'application/json',
        // Use token in request header
        },
      );
      print('oneoneeeeeeeee');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Decode the response with utf8 encoding
        final dynamic data = json.decode(utf8.decode(response.bodyBytes));
        print(data);
        return [data];
      } else {
        throw Exception('Failed to load product: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error fetching product: $error');
      return []; // Return an empty list on error
    }
  }

}