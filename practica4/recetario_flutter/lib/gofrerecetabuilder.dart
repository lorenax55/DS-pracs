import 'receta.dart';
import 'recetabuilder.dart';

class GofreRecetaBuilder extends RecetaBuilder {
  GofreRecetaBuilder() {
    super.receta = Receta('Gofres');
  }

  @override
  void buildIngredientes() {
    receta.setIngredientes("Harina, azúcar, leche, huevo, mantequilla");
  }

  @override
  void buildPasos() {
    receta.setPasos("Mezclar la harina, el azúcar, la leche, el huevo, la mantequilla. Cocinar en una gofrera caliente.");
  }

  @override
  void buildTiempo() {
    receta.setTiempoPreparacion(30);
  }
  
}