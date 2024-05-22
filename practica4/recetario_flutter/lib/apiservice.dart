import 'dart:convert';
import 'package:http/http.dart' as http;
import 'seccion.dart';
import 'receta.dart';
import 'usuario.dart';
class ApiService {
  static const String baseUrl = 'http://localhost:3000'; 

  Future<List<Seccion>> fetchSecciones(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/usuarios/$userId/secciones'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Seccion.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load secciones');
    }
  }

  Future<List<Receta>> fetchRecetas(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/usuarios/$userId/recetas'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Receta.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load recetas');
    }
  }

  Future<void> addSeccion(String userId, String nombre, {int? parentId}) async {
    final Map<String, dynamic> body = {
      'nombre': nombre,
    };
    if (parentId != null) {
      body['parent_id'] = parentId;
    }
    final response = await http.post(
      Uri.parse('$baseUrl/usuarios/$userId/secciones'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add seccion');
    }
  }

  Future<List<Usuario>> fetchUsuarios() async {
    final response = await http.get(Uri.parse('$baseUrl/usuarios'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Usuario.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load usuarios');
    }
  }

  Future<void> agregarRecetaASeccion(String userId, Receta receta, int seccionId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/usuarios/$userId/secciones/$seccionId/recetas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'receta': {
          'nombre': receta.nombre,
          'ingredientes': receta.ingredientes,
          'pasos': receta.pasos,
          'tiempo_preparacion': receta.tiempoPreparacion, 
        },
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add receta to seccion');
    }
  }


  Future<void> addUser(String nombre, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/usuarios'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': nombre,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add user');
    }
  }
}
