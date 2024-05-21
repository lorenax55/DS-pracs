import 'elemento.dart';
import 'receta.dart';

class Seccion implements Elemento {
  int? id;
  List<Elemento> elementos = [];
  String nombre;

  Seccion(this.nombre, {this.id});

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
      json['nombre'],
      id: json['id'],
    );
    if (json['elementos'] != null) {
      seccion.elementos = (json['elementos'] as List).map((item) {
        if (item['tipo'] == 'seccion') {
          return Seccion.fromJson(item);
        } else {
          return Receta.fromJson(item);
        }
      }).toList();
    }
    return seccion;
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nombre': nombre,
      'elementos': elementos.map((e) {
        if (e is Seccion) {
          return e.toJson();
        } else if (e is Receta) {
          return e.toJson();
        } else {
          throw Exception('Tipo desconocido de elemento');
        }
      }).toList(),
    };
  }
}
