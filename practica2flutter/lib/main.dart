import 'package:flutter/material.dart';
import 'package:practica2flutter/creeperecetabuilder.dart';
import 'package:practica2flutter/gofrerecetabuilder.dart';
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
        primarySwatch: Colors.amber,  
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.orange[300], 
        ),
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
    TortillaRecetaBuilder(),
    GofreRecetaBuilder(),
    CreepeRecetaBuilder(),
  ];

  final List<Color> colors = [
    Colors.lightBlue[100]!,
    Colors.lightGreen[100]!,
    Colors.lime[100]!,
    Colors.amber[100]!,
    Colors.red[100]!,  
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
                title: Row(
                children: [
                  const Text("Recetario"),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 50, 
                        child: Image.asset('assets/images/recetario.png'),
                      ),
                    ),
                ],
              ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: construirSelectorRecetas(),
            ),
            Expanded(
              flex: 3,
              child: mostrarSecciones(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => aniadirNuevaSeccion(),
                style: ElevatedButton.styleFrom(
                  backgroundColor : Color.fromARGB(255, 255, 255, 255),  
                  foregroundColor: Colors.blue, 
                ),
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
        title: const Text('Asignar Receta'),
        content: SingleChildScrollView(
          child: ListBody(
            children: generarListaSecciones(secciones, creador),
          ),
        ),
      );
    },
  );
}

List<Widget> generarListaSecciones(List<Seccion> secciones, RecetaBuilder creador, [String prefix = '']) {
  List<Widget> list = [];
  for (Seccion seccion in secciones) {
    String name = prefix + seccion.getNombre();
    list.add(TextButton(
      child: Text(name),
      onPressed: () {
        moverRecetaASeccion(creador, seccion);
        Navigator.of(context).pop();
      },
    ));
    if (seccion.getElementos().isNotEmpty) {
      list.addAll(generarListaSecciones(seccion.getElementos().whereType<Seccion>().toList(), creador, '  ' + prefix));
    }
  }
  return list;
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

  Widget crearTarjetaSeccion(Seccion seccion, [int depth = 0]) {
    Color backgroundColor = colors[depth % colors.length]; 
    return Card(
      color: backgroundColor,
      margin: EdgeInsets.all(depth > 0 ? 16.0 : 8.0),
      child: ExpansionTile(
      title: Row(
        children: [
          Text(seccion.getNombre()),
          if (seccion.getNombre() == 'Salado')
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 50, 
                child: Image.asset('assets/images/salero.png'),
              ),
            )else if (seccion.getNombre() == 'Dulce')
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: 50, 
                  child: Image.asset('assets/images/azucar.png'),
                ),
              ),
            
        ],
      ),
      initiallyExpanded: false,
        children: [
          for (var elemento in seccion.getElementos())
            elemento is Seccion
                ? crearTarjetaSeccion(elemento, depth + 1) 
                : ListTile(
                    title: Text(elemento.getNombre()),
                    subtitle: Text(elemento.mostrar()),
                  ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => aniadirSubseccion(seccion),
              child: Text('Añadir Subsección'),
            ),
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
                Navigator.of(context). pop();
              },
            ),
          ],
        );
      },
    );
  }

  void aniadirSubseccion(Seccion parent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controladorNombreSeccion = TextEditingController();
        return AlertDialog(
          title: Text('Nueva Subsección'),
          content: TextField(
            controller: controladorNombreSeccion,
            decoration: InputDecoration(hintText: "Nombre de la Subsección"),
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
                  Seccion newSubsection = Seccion(controladorNombreSeccion.text);
                  parent.add(newSubsection);
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
