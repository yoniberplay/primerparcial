import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//YONIBER ENCARNACION
//2021-1442
class presentacion_view extends StatelessWidget {
  const presentacion_view({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String fecha = DateFormat('dd/MM/yyyy').format(now);
    String hora = DateFormat('hh:mm a').format(now);

    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/foto.jpeg', width: 200, height: 200),
          SizedBox(height: 20),
          Text(
            'Yoniber Encarnacion',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            '$fecha',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '$hora',
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );
  }
}
