import 'elemento.dart';

class Receta implements Elemento{

  late String ingredientes;
  late String pasos;
  late int tiempoPreparacion;

  @override
  String nombre = '';

  Receta(this.nombre) {
    ingredientes = '';
    pasos = '';
    tiempoPreparacion = 0;
  }
  void setIngredientes(String ingredientes) {
    this.ingredientes = ingredientes;
  }

  void setPasos(String pasos) {
    this.pasos = pasos;
  }

  void setTiempoPreparacion(int tiempoPreparacion) {
    this.tiempoPreparacion = tiempoPreparacion;
  }

  @override
  String toString() {
    return 'Ingredientes: $ingredientes\nPasos: $pasos\nTiempo de preparacion: $tiempoPreparacion minutos';
  }

  @override
  void add(Elemento elemento) {
    throw UnimplementedError();
  }
  @override
  void remove(Elemento elemento) {
    throw UnimplementedError();
  }
  @override
  String mostrar() {
    return toString();
  }

  @override
  String getNombre() {
    return nombre;
  }
  @override
  List<Elemento> getElementos() {
    throw UnimplementedError();
  }
}