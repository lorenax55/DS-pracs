abstract class Elemento {
  late String nombre;

  void add(Elemento elemento);
  void remove(Elemento elemento);
  String mostrar();
  String getNombre();
  List<Elemento>  getElementos();
}
