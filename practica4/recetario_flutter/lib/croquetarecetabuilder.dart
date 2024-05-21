import 'receta.dart';
import 'recetabuilder.dart';

class CroquetaRecetaBuilder extends RecetaBuilder {
  CroquetaRecetaBuilder() {
    super.receta = Receta('Croquetas');
  }

  @override
  void buildIngredientes() {
    receta.setIngredientes("Leche, harina, mantequilla, jamón, huevo, pan rallado, aceite");
  }

  @override
  void buildPasos() {
    receta.setPasos("Hacer una bechamel con la leche, la harina y la mantequilla. Añadir el jamón y dejar enfriar. Formar las croquetas, pasar por huevo y pan rallado y freír en aceite caliente.");
  }

  @override
  void buildTiempo() {
    receta.setTiempoPreparacion(60);
  }
  
}