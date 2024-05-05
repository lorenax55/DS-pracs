import 'package:flutter_test/flutter_test.dart';
import 'package:practica2flutter/seccion.dart';
import 'package:practica2flutter/recetabuilder.dart';
import 'package:practica2flutter/creeperecetabuilder.dart';
import 'package:practica2flutter/tortillarecetabuilder.dart';

void main() {
  group('Grupo 1 Secciones', () {
    
    List<Seccion> recetario;
    List<RecetaBuilder> creadroesRecetas;
    recetario = [
      Seccion('Dulce'),
    ];
    creadroesRecetas = [CreepeRecetaBuilder(), TortillaRecetaBuilder()];
    test('Crear seccion y meter receta', () {
      expect(recetario[0].getNombre(), 'Dulce');
      expect(recetario.length, 1);

      recetario[0].add(creadroesRecetas[0].getReceta());
      expect(recetario[0].elementos.length, 1);
      expect(recetario[0].elementos[0].nombre, 'Creepes');
    });

    test('Crear subseccion', () {
      recetario[0].add(Seccion('Postres'));
      expect(recetario[0].elementos.length, 2);
      expect(recetario[0].elementos[1].nombre, 'Postres');
    });

    test('Poner receta a subseccion', () {
      recetario[0].elementos[1].add(creadroesRecetas[1].getReceta());
      expect(recetario[0].elementos[1].getElementos().length, 1);
      expect(recetario[0].elementos[1].getElementos()[0].nombre,
          'Tortilla de patatas');
    });

    test('Mostrar sección y recetas', () {
      expect(recetario[0].mostrar(),
          'Creepes Ingredientes: \n'
              'Pasos: \n'
              'Tiempo de preparacion: 0 minutos\n'
              'Postres Tortilla de patatas Ingredientes: \n'
              'Pasos: \n'
              'Tiempo de preparacion: 0 minutos\n'
              '\n'
              '');
      expect(recetario[0].elementos[1].mostrar(), 
          'Tortilla de patatas Ingredientes: \n'
          'Pasos: \n'
          'Tiempo de preparacion: 0 minutos\n'
          '');
      });


  });
}
