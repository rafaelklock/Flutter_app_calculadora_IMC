import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        elevation: 1,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_pin, size: 120, color: Colors.green),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
            decoration: InputDecoration(
                labelText: "Peso (kg):",
                labelStyle: TextStyle(color: Colors.green)),
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
            decoration: InputDecoration(
                labelText: "Altura (cm):",
                labelStyle: TextStyle(color: Colors.green)),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Calcular"),
          )
        ],
      ),
    );
  }
}
