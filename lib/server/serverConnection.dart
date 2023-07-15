import 'dart:convert';

import 'package:http/http.dart' as http;

class ServerConnection{

  String serverAddress= "http://192.168.1.100:8180/api/";


  Future<bool> authenticate(String email, String password) async {
    try {
      final url = Uri.parse('http://192.168.0.26:8180/api/signin_data/authenticate');
      final client = http.Client();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final Map<String, String> body = {
        'email': email,
        'password': password,
      };

      final response = await client.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        // Assuming the server is returning a boolean value directly
        bool isSuccess = response.body.toLowerCase() == 'true';
        print("Authentication Successful: $isSuccess");
        return isSuccess;
      } else {
        // Unsuccessful response.
        print("Authentication Failed - Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return false;
      }
    } catch (e) {
      // Error occurred during the request.
      print("CONNECTION TEST FAILED: $e");
      return false;
    }
  }
}