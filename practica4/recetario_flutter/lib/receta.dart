import 'elemento.dart';
class Receta implements Elemento {
  int? id;
  String nombre;
  late String ingredientes;
  late String pasos;
  late int tiempoPreparacion;
  int? idseccion;

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
  }factory Receta.fromJson(Map<String, dynamic> json) {
  if (!json.containsKey('nombre') || json['nombre'] == null) {
    throw Exception('Falta el campo "nombre" en el JSON');
  }

  Receta receta = Receta(
    json['nombre'],
    id: json['id'],
  );

  if (json.containsKey('ingredientes') && json['ingredientes'] != null) {
    receta.setIngredientes(json['ingredientes']);
  } else {
    throw Exception('Falta el campo "ingredientes" o es nulo en el JSON');
  }

  if (json.containsKey('pasos') && json['pasos'] != null) {
    receta.setPasos(json['pasos']);
  } else {
    throw Exception('Falta el campo "pasos" o es nulo en el JSON');
  }

  if (json.containsKey('tiempoPreparacion')) {
    if (json['tiempoPreparacion'] is num) {
      receta.setTiempoPreparacion(json['tiempoPreparacion'].toInt());
    } else {
      throw Exception('El campo "tiempoPreparacion" debe ser un número en el JSON');
    }
  }

  // Asignar el id de la sección si está presente en el JSON
  if (json.containsKey('seccion_id') && json['seccion_id'] != null) {
    receta.idseccion = json['seccion_id'];
  }

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
