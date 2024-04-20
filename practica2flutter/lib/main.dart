import 'package:flutter/material.dart';
import 'chef.dart';
import 'receta.dart';
import 'recetabuilder.dart';
import 'croquetarecetabuilder.dart';
import 'tortillarecetabuilder.dart';
import 'seccion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecetasHome(),
    );
  }
}

class RecetasHome extends StatefulWidget {
  @override
  _RecetasHomeState createState() => _RecetasHomeState();
}

class _RecetasHomeState extends State<RecetasHome> {
  List<Seccion> secciones = [
    Seccion('Dulce'),
    Seccion('Salado'),
  ];

  final List<RecetaBuilder> creadoresRecetas = [
    CroquetaRecetaBuilder(),
    TortillaRecetaBuilder(), // Lista de creadores de recetas.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetario'),
      ),
      body: Column(
        children: [
          Expanded(child: construirSelectorRecetas()),
          Expanded(child: mostrarSecciones()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => aniadirNuevaSeccion(),
              child: Text('Añadir Nueva Sección'),
            ),
          ),
        ],
      ),
    );
  }

  Widget construirSelectorRecetas() {
    return ListView.builder(
      itemCount: creadoresRecetas.length,
      itemBuilder: (context, index) {
        var creadorReceta = creadoresRecetas[index];
        return ListTile(
          title: Text(creadorReceta.receta.getNombre()),
          subtitle: Text('Toca para asignar sección'),
          onTap: () => mostrarDialogoSeccion(creadorReceta),
        );
      },
    );
  }

  void mostrarDialogoSeccion(RecetaBuilder creador) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Asignar Receta'),
          content: Text('¿En qué sección deseas colocar la receta?'),
          actions: secciones.map((seccion) => TextButton(
            child: Text(seccion.getNombre()),
            onPressed: () {
              moverRecetaASeccion(creador, seccion);
              Navigator.of(context).pop();
            },
          )).toList(),
        );
      },
    );
  }

  void moverRecetaASeccion(RecetaBuilder creador, Seccion seccion) {
    Chef chef = Chef();
    chef.setRecetaBuilder(creador);
    chef.buildReceta();
    Receta receta = chef.getReceta();
    setState(() {
      seccion.add(receta);
    });
  }

  Widget mostrarSecciones() {
    return ListView(
      children: secciones.map((seccion) => crearTarjetaSeccion(seccion)).toList(),
    );
  }

  Widget crearTarjetaSeccion(Seccion seccion) {
    return Card(
      child: ExpansionTile(
        title: Text(seccion.getNombre()),
        initiallyExpanded: false,
        children: [
          for (var elemento in seccion.getElementos()) 
            ListTile(
              title: Text(elemento.getNombre()),
              subtitle: Text(elemento.mostrar()),
            ),
        ],
      ),
    );
  }

  void aniadirNuevaSeccion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controladorNombreSeccion = TextEditingController();
        return AlertDialog(
          title: Text('Nueva Sección'),
          content: TextField(
            controller: controladorNombreSeccion,
            decoration: InputDecoration(hintText: "Nombre de la Sección"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Añadir'),
              onPressed: () {
                setState(() {
                  secciones.add(Seccion(controladorNombreSeccion.text));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
