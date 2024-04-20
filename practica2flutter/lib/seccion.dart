
import 'elemento.dart';

class Seccion implements Elemento {

  List<Elemento> elementos = [];

  @override
  String nombre = "";

  Seccion(this.nombre);

  @override
  void add(Elemento elemento) {
    elementos.add(elemento);
  }
  @override
  void remove(Elemento elemento) {
    elementos.remove(elemento);
  }
  @override
  String mostrar() {
    String result = '';
    for (Elemento elemento in elementos) {
      result += elemento.getNombre() + " " + elemento.mostrar() + '\n';
    }
    return result;
  }

  @override
  String getNombre() {
    return nombre;
  }

  List<Elemento> getElementos() {
    return elementos;
  }
}