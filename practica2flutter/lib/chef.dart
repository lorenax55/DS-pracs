import 'recetabuilder.dart';
import 'receta.dart';

class Chef {
    RecetaBuilder? recetaBuilder;

    void setRecetaBuilder(RecetaBuilder rb) {
      recetaBuilder = rb;
    }

    Receta getReceta() {
      if (recetaBuilder == null) {
        throw Exception('RecetaBuilder no ha sido construido');
      }
      return recetaBuilder!.getReceta();
    }

    void buildReceta() {
        if (recetaBuilder == null) {
            throw Exception('RecetaBuilder no ha sido construido');
        }
        recetaBuilder!.buildIngredientes();
        recetaBuilder!.buildPasos();
        recetaBuilder!.buildTiempo();
    }
}
