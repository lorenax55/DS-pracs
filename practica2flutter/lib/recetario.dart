import 'package:flutter/material.dart';
import 'package:practica2flutter/croquetarecetabuilder.dart';
import 'package:practica2flutter/tortillarecetabuilder.dart';
import 'seccion.dart';
import 'chef.dart';

class Recetario extends StatefulWidget {
  @override
  _RecetarioState createState() => _RecetarioState();

  Seccion secciones = Seccion("Recetario");
  Chef chef = Chef();
  Recetario() {
    secciones.add(Seccion("Salados"));
    secciones.add(Seccion("Dulces"));
  }
}

class _RecetarioState extends State<Recetario> {
  String dropdownValue = "Croqueta";

  void creaComida(String comida) {
    if (comida == "Croqueta") {
      CroquetaRecetaBuilder croquetaRecetaBuilder = CroquetaRecetaBuilder();
      widget.chef.setRecetaBuilder(croquetaRecetaBuilder);
      widget.chef.buildReceta();
    } else {
      TortillaRecetaBuilder tortillaRecetaBuilder = TortillaRecetaBuilder();
      widget.chef.setRecetaBuilder(tortillaRecetaBuilder);
      widget.chef.buildReceta();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var seccion in widget.secciones.getElementos())
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      seccion.getNombre(),
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      seccion.mostrar(),
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (dropdownValue == 'Croqueta') {
                          creaComida('Croqueta');
                          seccion.add(widget.chef.getReceta());
                        } else{
                          creaComida('Tortilla');
                          seccion.add(widget.chef.getReceta());
                        }
                      },
                      child: Text('Agregar'),
                    ),
                  ],
                ),
              ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Croqueta', 'Tortilla']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
