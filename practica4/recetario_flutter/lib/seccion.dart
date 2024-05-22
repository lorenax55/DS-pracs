import 'elemento.dart';
import 'receta.dart';

class Seccion implements Elemento {
  int? id;
  List<Elemento> elementos = [];
  String nombre;
  int? parent_id;

  Seccion(this.nombre, {this.id, this.parent_id});

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

  @override
  List<Elemento> getElementos() {
    return elementos;
  }

  factory Seccion.fromJson(Map<String, dynamic> json) {
    Seccion seccion = Seccion(
      json['nombre'] ?? '', 
      id: json['id'],
      parent_id: json['parent_id'],
    );

    if (json['elementos'] != null) {
      seccion.elementos = (json['elementos'] as List).map((item) {
        if (item is Map<String, dynamic> &&
            item.containsKey('tipo') &&
            item.containsKey('nombre')) {
          if (item['tipo'] == 'receta') {
            return Receta.fromJson(item);
          } else {
            throw Exception('Error tipo : ${item['tipo']}');
          }
        } else {
          throw Exception('Error estructuca: $item');
        }
      }).toList();
    }
    return seccion;
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nombre': nombre,
      if (parent_id != null) 'parent_id': parent_id,
      'elementos': elementos.map((e) {
        if (e is Receta) {
          return e.toJson();
        } else {
          throw Exception('Error tipo');
        }
      }).toList(),
    };
  }
}
