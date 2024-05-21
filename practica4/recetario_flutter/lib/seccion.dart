import 'elemento.dart';
import 'receta.dart';

class Seccion implements Elemento {
  int? id;
  List<Elemento> elementos = [];
  String nombre;
  int? idpadre;

  Seccion(this.nombre, {this.id, this.idpadre});

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
    json['nombre'] ?? '', // Asegurando que el nombre no sea nulo
    id: json['id'],
    idpadre: json['idpadre'],
  );
  if (json['subsecciones'] != null) {
    // Recorrer las subsecciones y convertirlas en instancias de Seccion
    List<dynamic> subsecciones = json['subsecciones'];
    subsecciones.forEach((subseccionJson) {
      Seccion subseccion = Seccion.fromJson(subseccionJson);
      seccion.add(subseccion); // Agregar la subsección a la sección actual
    });
  }
  // Ahora manejar los elementos (recetas) dentro de esta sección
  if (json['elementos'] != null) {
    seccion.elementos = (json['elementos'] as List).map((item) {
      // Verificar si el elemento tiene la estructura esperada (tipo, nombre)
      if (item is Map<String, dynamic> &&
          item.containsKey('tipo') &&
          item.containsKey('nombre')) {
        if (item['tipo'] == 'receta') {
          return Receta.fromJson(item);
        } else {
          throw Exception('Tipo desconocido de elemento: ${item['tipo']}');
        }
      } else {
        throw Exception('Estructura de elemento inválida: $item');
      }
    }).toList();
  }
  return seccion;
}

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nombre': nombre,
      if (idpadre != null) 'idpadre': idpadre,
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
