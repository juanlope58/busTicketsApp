import 'package:http/http.dart' as http;

class AuthService {
  Future<void> checkAuthentication() async {
    try {
      final response = await http.get(
        Uri.parse('________'),
        // Puedes agregar encabezados u otras configuraciones según tus necesidades
      );

      if (response.statusCode == 200) {
        // Autenticado
      } else {
        // Sin autenticar
      }
    } catch (error) {
      // error al verificar la autenticación
    }
  }
}