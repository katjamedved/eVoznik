import 'package:http/http.dart' as http;

class ServerConnection{

  String serverAddress= "http://192.168.1.100:8180/api/";


  Future<bool> authenticate(String email, String password) async {
    print("SERVER CONNECTION TEST");
    try{
      final url = Uri.parse('http://192.168.1.26:8180/api/signin_data/authenticate');
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      print("CONNECTING TO THE SERVER");
      print("RESPONSE: $response");
    }catch(e){
      print("CONNECTION TEST FAILED: $e");
    }
    return false;
  }

}