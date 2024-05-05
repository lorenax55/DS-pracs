import 'package:flutter_test/flutter_test.dart'
    show expect, group, test, equals, throwsException;
import 'package:practica2flutter/gofrerecetabuilder.dart';
import 'package:practica2flutter/croquetarecetabuilder.dart';
import 'package:practica2flutter/tortillarecetabuilder.dart';
import 'package:practica2flutter/creeperecetabuilder.dart';
import 'package:practica2flutter/chef.dart';

void main() {
  group('Builder Tests', () {
    TortillaRecetaBuilder builderT = TortillaRecetaBuilder();
    GofreRecetaBuilder builderG = GofreRecetaBuilder();
    CreepeRecetaBuilder builderC = CreepeRecetaBuilder();
    test('GofreRecetaBuilder crea un gofre', () {
      builderG.buildIngredientes();
      builderG.buildPasos();
      builderG.buildTiempo();

      final receta = builderG.getReceta();

      expect(receta.ingredientes,
          equals('Harina, azúcar, leche, huevo, mantequilla'));
      expect(
          receta.pasos,
          equals(
              'Mezclar la harina, el azúcar, la leche, el huevo, la mantequilla. Cocinar en una gofrera caliente.'));
      expect(receta.tiempoPreparacion, equals(30));
    });

    test('CroquetaRecetaBuilder crea una croqueta', () {
      CroquetaRecetaBuilder builder = CroquetaRecetaBuilder();

      builder.buildIngredientes();
      builder.buildPasos();
      builder.buildTiempo();

      final receta = builder.getReceta();

      expect(
          receta.ingredientes,
          equals(
              'Leche, harina, mantequilla, jamón, huevo, pan rallado, aceite'));
      expect(
          receta.pasos,
          equals(
              'Hacer una bechamel con la leche, la harina y la mantequilla. Añadir el jamón y dejar enfriar. Formar las croquetas, pasar por huevo y pan rallado y freír en aceite caliente.'));
      expect(receta.tiempoPreparacion, equals(60));
    });

    test('CreepeRecetaBuilder crea un creepe', () {
      builderC.buildIngredientes();
      builderC.buildPasos();
      builderC.buildTiempo();

      final receta = builderC.getReceta();

      expect(receta.ingredientes,
          equals('Harina, leche, huevo, mantequilla, azúcar'));
      expect(
          receta.pasos,
          equals(
              'Mezclar la harina, la leche, el huevo y el azúcar. Cocinar en una sartén caliente.'));
      expect(receta.tiempoPreparacion, equals(20));
    });
    test('TortillaRecetaBuilder crea una tortilla de patatas', () {
      builderT.buildIngredientes();
      builderT.buildPasos();
      builderT.buildTiempo();

      final receta = builderT.getReceta();

      expect(
          receta.ingredientes, equals('Huevos, patatas, cebolla, sal, aceite'));
      expect(
          receta.pasos,
          equals(
              'Pelar y cortar las patatas y la cebolla. Batir los huevos y mezclar con las patatas y la cebolla. Freír en una sartén con aceite caliente.'));
      expect(receta.tiempoPreparacion, equals(30));
    });

    group('Chef Tests', () {
      Chef chef = Chef();
      GofreRecetaBuilder gofreBuilder = GofreRecetaBuilder();
      CroquetaRecetaBuilder croquetaBuilder = CroquetaRecetaBuilder();

      test('Construir receta sin espeficar cual', () {
        // si la receta no ha sido construida, debe dar error

        expect(() => chef.buildReceta(), throwsException);
      });

      test('Intentar obtener receta sin espeficar', () {
        // si la receta no ha sido construida, debe dar error

        expect(() => chef.getReceta(), throwsException);
      });

      test('Chef cambia de builder y construye recetas distintas correctamente',
          () {
        // Construir gofres primero
        chef.setRecetaBuilder(gofreBuilder);
        chef.buildReceta();
        var receta = chef.getReceta();
        expect(receta.nombre, equals('Gofres'));

        // Cambiar a croquetas y construir
        chef.setRecetaBuilder(croquetaBuilder);
        chef.buildReceta();
        receta = chef.getReceta();
        expect(receta.nombre, equals('Croquetas'));
      });
    });
  });
}
