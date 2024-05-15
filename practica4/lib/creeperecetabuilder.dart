import 'receta.dart';
import 'recetabuilder.dart';

class CreepeRecetaBuilder extends RecetaBuilder {
 
  CreepeRecetaBuilder() {
    super.receta = Receta('Creepes');
  }

  @override
  void buildIngredientes() {
    receta.setIngredientes("Harina, leche, huevo, mantequilla, azúcar");
  }

  @override
  void buildPasos() {
    receta.setPasos("Mezclar la harina, la leche, el huevo y el azúcar. Cocinar en una sartén caliente.");
  }

  @override
  void buildTiempo() {
    receta.setTiempoPreparacion(20);
  }
}