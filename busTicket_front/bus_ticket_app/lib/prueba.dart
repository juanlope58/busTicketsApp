import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(Uri.parse('http://localhost:8080/api/city/cities'));
  print(response.statusCode);
  print(response.body);
}
