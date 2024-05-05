import 'receta.dart';

abstract class RecetaBuilder {
  Receta receta;

  RecetaBuilder() : receta = Receta('');

  Receta getReceta() {
    return receta;
  }

  void buildIngredientes();
  void buildPasos();
  void buildTiempo();
}
