import 'recetabuilder.dart';
import 'receta.dart';

class Chef {
    late RecetaBuilder recetaBuilder;

    void setRecetaBuilder(RecetaBuilder rb) {
      recetaBuilder = rb;
    }

    Receta getReceta() {
      return recetaBuilder.getReceta();
    }

    void buildReceta() {
        recetaBuilder.buildIngredientes();
        recetaBuilder.buildPasos();
        recetaBuilder.buildTiempo();
    }
}