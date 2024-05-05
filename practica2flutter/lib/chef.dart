import 'recetabuilder.dart';
import 'receta.dart';

class Chef {
    RecetaBuilder? recetaBuilder;

    void setRecetaBuilder(RecetaBuilder rb) {
      recetaBuilder = rb;
    }

    Receta getReceta() {
      if (recetaBuilder == null) {
        throw Exception('RecetaBuilder no ha sido configurado.');
      }
      return recetaBuilder!.getReceta();
    }

    void buildReceta() {
        if (recetaBuilder == null) {
            throw Exception('RecetaBuilder no ha sido configurado.');
        }
        recetaBuilder!.buildIngredientes();
        recetaBuilder!.buildPasos();
        recetaBuilder!.buildTiempo();
    }
}
