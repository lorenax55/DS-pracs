import 'dart:convert';
import 'package:http/http.dart' as http;
import 'receta.dart';
import 'seccion.dart';

class GestorDeRecetas {
  List<Receta> misRecetas = [];
  List<Seccion> misSecciones = [];
  final String apiUrl = "http://127.0.0.1:3000"; // URL de tu API

  Future<void> cargarRecetas(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrl/recetas?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> recetasJson = json.decode(response.body);
      misRecetas.clear();
      misRecetas.addAll(recetasJson.map((json) => Receta.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<void> agregarReceta(Receta receta) async {
    final response = await http.post(
      Uri.parse('$apiUrl/recetas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(receta.toJson()),
    );
    if (response.statusCode == 201) {
      misRecetas.add(Receta.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add recipe: ${response.body}');
    }
  }

  Future<void> eliminarReceta(Receta receta) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/recetas/${receta.id}'),
    );
    if (response.statusCode == 200) {
      misRecetas.removeWhere((r) => r.id == receta.id);
    } else {
      throw Exception('Failed to delete recipe');
    }
  }

  Future<void> cargarSecciones(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrl/secciones?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> seccionesJson = json.decode(response.body);
      misSecciones.clear();
      misSecciones.addAll(seccionesJson.map((json) => Seccion.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load sections');
    }
  }

  Future<void> agregarSeccion(Seccion seccion) async {
    final response = await http.post(
      Uri.parse('$apiUrl/secciones'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(seccion.toJson()),
    );
    if (response.statusCode == 201) {
      misSecciones.add(Seccion.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add section: ${response.body}');
    }
  }

  Future<void> eliminarSeccion(Seccion seccion) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/secciones/${seccion.id}'),
    );
    if (response.statusCode == 200) {
      misSecciones.removeWhere((s) => s.id == seccion.id);
    } else {
      throw Exception('Failed to delete section');
    }
  }
}
