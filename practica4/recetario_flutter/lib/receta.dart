import 'elemento.dart';

class Receta implements Elemento {
  int? id;
  String nombre;
  late String ingredientes;
  late String pasos;
  late int tiempoPreparacion;

  Receta(this.nombre, {this.id}) {
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

  factory Receta.fromJson(Map<String, dynamic> json) {
    Receta receta = Receta(
      json['nombre'],
      id: json['id'],
    );
    receta.setIngredientes(json['ingredientes']);
    receta.setPasos(json['pasos']);
    receta.setTiempoPreparacion(json['tiempoPreparacion']);
    return receta;
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nombre': nombre,
      'ingredientes': ingredientes,
      'pasos': pasos,
      'tiempoPreparacion': tiempoPreparacion,
    };
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
