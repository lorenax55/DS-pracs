import 'package:flutter_test/flutter_test.dart';
import 'package:practica2flutter/seccion.dart';
import 'package:practica2flutter/recetabuilder.dart';
import 'package:practica2flutter/creeperecetabuilder.dart';
import 'package:practica2flutter/tortillarecetabuilder.dart';

void main() {
  group('Grupo 1 Secciones', () {
    List<Seccion> recetario;
    List<RecetaBuilder> creadoresRecetas;
    recetario = [
      Seccion('Dulce'),
    ];
    creadoresRecetas = [CreepeRecetaBuilder(), TortillaRecetaBuilder()];
    test('Crear seccion y meter receta', () {
      expect(recetario[0].getNombre(), 'Dulce');
      expect(recetario.length, 1);

      recetario[0].add(creadoresRecetas[0].getReceta());
      expect(recetario[0].elementos.length, 1);
      expect(recetario[0].elementos[0].nombre, 'Creepes');
    });

    test('Crear subseccion', () {
      recetario[0].add(Seccion('Postres'));
      expect(recetario[0].elementos.length, 2);
      expect(recetario[0].elementos[1].nombre, 'Postres');
    });

    test('Poner receta a subseccion', () {
      recetario[0].elementos[1].add(creadoresRecetas[1].getReceta());
      expect(recetario[0].elementos[1].getElementos().length, 1);
      expect(recetario[0].elementos[1].getElementos()[0].nombre,
          'Tortilla de patatas');
    });

    test('Mostrar sección y recetas', () {
      expect(
          recetario[0].mostrar(),
          'Creepes Ingredientes: \n'
          'Pasos: \n'
          'Tiempo de preparacion: 0 minutos\n'
          'Postres Tortilla de patatas Ingredientes: \n'
          'Pasos: \n'
          'Tiempo de preparacion: 0 minutos\n'
          '\n'
          '');
      expect(
          recetario[0].elementos[1].mostrar(),
          'Tortilla de patatas Ingredientes: \n'
          'Pasos: \n'
          'Tiempo de preparacion: 0 minutos\n'
          '');
    });

    test('Crear una subsección en una subsección', () {
      Seccion seccionPrincipal = Seccion('Principal');
      Seccion primeraSubseccion = Seccion('Subsección 1');
      seccionPrincipal.add(primeraSubseccion);
      Seccion subSubseccion = Seccion('Subsección 1.1');
      primeraSubseccion.add(subSubseccion);

      expect(
          seccionPrincipal.elementos.first.getElementos().first, subSubseccion);
      expect(seccionPrincipal.elementos.first.getElementos().first.getNombre(),
          'Subsección 1.1');
    });

    test('Agregar varias recetas a una sección', () {
      recetario[0].add(creadoresRecetas[0].getReceta());
      recetario[0].add(creadoresRecetas[1].getReceta());
      // recetario[0].elementos[0] --> Creepes
      // recetario[0].elementos[1] --> POSTRES
      expect(recetario[0].elementos[2].nombre, 'Creepes');
      expect(recetario[0].elementos[3].nombre, 'Tortilla de patatas');
    });
    test('Intentar crear subsección en receta', () {
      var receta = creadoresRecetas[0].getReceta();
      recetario[0].add(receta);
      expect(() => receta.add(Seccion('Subsección inválida')),
          throwsUnimplementedError);
    });
  });
}
