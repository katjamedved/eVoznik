import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/TokenManeger.dart';

class ServerConnection{

  final String _localAddress= "http://192.168.0.27:8180/api/signin_data";
  final String _remoteAddress= "http://86.58.58.236:8180/api/signin_data";

  Future<bool> authenticate(String email, String password,TokenManager tokenManager) async {
    try {
      final url = Uri.parse('$_localAddress/authenticate');
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
        final Map<String, dynamic> responseData = json.decode(response.body);

        if(responseData["success"] == true){
          tokenManager.storeToken(responseData['token']);
          print("Token saved successfully");
        }
        else{
          String message = responseData['message'];
          print("Server response message : $message");
        }
        return responseData["success"];

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
  Future<bool> verifyTokenWithServer(String token,TokenManager tokenManager) async {
    try {
      final url = Uri.parse('$_localAddress/authenticateToken');
      final client = http.Client();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final Map<String, String> body = {
        'token': token,
      };

      final response = await client.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if(responseData["success"] == true){
          tokenManager.removeToken();
          tokenManager.storeToken(responseData["token"]);
          print("Token updated successfully");
        }
        else{
          tokenManager.removeToken();
          String message = responseData['message'];
          print("Server response message : $message");
        }
        return responseData["success"];

      } else {
        // Unsuccessful response.
        print("Authentication Failed - Status Code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      // Error occurred during the request.
      print("CONNECTION TEST FAILED: $e");
      return false;
    }
  }
}