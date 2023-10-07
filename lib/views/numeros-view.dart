import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//YONIBER ENCARNACION numeros_view
//2021-1442

class numeros_view extends StatefulWidget {
  const numeros_view({super.key});

  @override
  State<numeros_view> createState() => _numeros_view();
}

class _numeros_view extends State<numeros_view> {
  TextEditingController numcontr1 = TextEditingController();
  TextEditingController numcontr2 = TextEditingController();
  TextEditingController numcontr3 = TextEditingController();

  double mayor = 0;
  double menor = 0;
  double promedio = 0;

  void calcular() {
    double num1 = double.tryParse(numcontr1.text) ?? 0;
    double num2 = double.tryParse(numcontr2.text) ?? 0;
    double num3 = double.tryParse(numcontr3.text) ?? 0;

    List<double> numeros = [num1, num2, num3];
    numeros.sort();
    setState(() {
      mayor = numeros[2];
      menor = numeros[0];
      promedio = (num1 + num2 + num3) / 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Mayor, Menor y Promedio',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextFormField(
                controller: numcontr1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    labelText: 'Numero 1',
                    hintText: 'Numero 1',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextFormField(
                controller: numcontr2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    labelText: 'Numero 2',
                    hintText: 'Numero 2',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextFormField(
                controller: numcontr3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    labelText: 'Numero 3',
                    hintText: 'Numero 3',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              child: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
              ),
              onPressed: calcular,
            ),
            SizedBox(height: 20),
            Text(
              'Mayor: $mayor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Menor: $menor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Promedio: $promedio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
