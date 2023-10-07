import 'package:flutter/material.dart';
import 'package:primerparcial/views/numeros-view.dart';
import 'package:primerparcial/views/presentacion-view.dart';
import 'package:primerparcial/views/tabla-view.dart';

void main() {
  runApp(const MyApp());
}

//YONIBER ENCARNACION
//2021-1442
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primer Parcial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Primer Parcial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int posicion = 0;

  //crear variable estatica que contendra pantallas
  static var pantallas = [
    const presentacion_view(),
    tabla_view(),
    numeros_view(),
  ];

  static const List<Destination> allDestination = <Destination>[
    Destination(0, 'Presentacion', Icons.file_present, Colors.green),
    Destination(1, 'Tabla', Icons.confirmation_number, Colors.green),
    Destination(2, 'Numeros', Icons.donut_large_sharp, Colors.green),
  ];
  void cambioPantalla(int index) {
    setState(() {
      posicion = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: posicion,
        children: pantallas,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: posicion,
        onDestinationSelected: (index) {
          cambioPantalla(index);
        },
        destinations: allDestination.map((Destination destination) {
          return NavigationDestination(
            icon: Icon(destination.icon, color: destination.color),
            label: destination.title,
          );
        }).toList(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
