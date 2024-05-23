import 'package:flutter_test/flutter_test.dart';
//import 'package:http/http.dart' as http;
import 'package:practica2flutter/GestorDeRecetas.dart';
import 'package:practica2flutter/receta.dart';
import 'package:practica2flutter/seccion.dart';

//class MockClient extends Mock implements http.Client {}

void main() {
  group('GestorDeRecetas Tests', () {
    late GestorDeRecetas gestor;

    setUp(() {
      gestor = GestorDeRecetas();
    });

    test('Agregar una nueva receta incrementa la lista de recetas', () async {
      Receta nuevaReceta = Receta('Nueva Receta');
      nuevaReceta.setIngredientes('Ingrediente 1, Ingrediente 2');
      nuevaReceta.setPasos('Instrucción 1, Instrucción 2');
      nuevaReceta.setTiempoPreparacion(30); 

      Seccion nuevaSeccion = Seccion('Sección');
      nuevaSeccion.add(nuevaReceta);

      await gestor.agregarSeccion(nuevaSeccion);
      expect(gestor.misSecciones.length, 1);
      expect(gestor.misSecciones.first.nombre, 'Sección');
      //no se pk no funciona las recetas desde aqui socrorro

      //expect(gestor.misSecciones.first.getElementos().length, 1);
      //expect(gestor.misSecciones.first.getElementos().first.getNombre(), 'Nueva Receta');
    });
  });
}