import 'recetabuilder.dart';
import 'receta.dart';

class TortillaRecetaBuilder extends RecetaBuilder {
  TortillaRecetaBuilder() {
    super.receta = Receta('Tortilla de patatas');
  }

  @override
  void buildIngredientes() {
    receta.setIngredientes("Huevos, patatas, cebolla, sal, aceite");
  }

  @override
  void buildPasos() {
    receta.setPasos("Pelar y cortar las patatas y la cebolla. Batir los huevos y mezclar con las patatas y la cebolla. Freír en una sartén con aceite caliente.");
  }

  @override
  void buildTiempo() {
    receta.setTiempoPreparacion(30);
  }
}
