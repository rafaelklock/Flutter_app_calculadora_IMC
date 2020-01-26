import 'package:flutter/cupertino.dart';
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = 'Informe seus dados!!';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _caluloIMC() {
    setState(() {
      double weigth = double.parse(weightController.text);
      double heigth = double.parse(heightController.text) / 100;
      double imc = weigth / (heigth * heigth);

      if (imc >= 5 && imc < 17) {
        _infoText = 'Muito abaixo do peso (IMC: ${imc.toStringAsPrecision(4)})';
      } else if (imc >= 17 && imc <= 18.49) {
        _infoText = 'abaixo do peso (IMC: ${imc.toStringAsPrecision(4)})';
      } else if (imc > 18.49 && imc <= 25) {
        _infoText = 'peso ideal (IMC: ${imc.toStringAsPrecision(4)})';
      } else if (imc > 25 && imc <= 30) {
        _infoText = 'acima do peso (IMC: ${imc.toStringAsPrecision(4)})';
      } else if (imc > 30 && imc <= 35) {
        _infoText = 'obesidade I (IMC: ${imc.toStringAsPrecision(4)})';
      } else if (imc > 35 && imc <= 40) {
        _infoText = 'obesidade II (severa) (IMC: ${imc.toStringAsPrecision(4)})';
      } else if (imc > 40 && imc <= 70) {
        _infoText = 'obesidade III (mórbida) (IMC: ${imc.toStringAsPrecision(4)})';
      } else {
        _infoText = 'Valores inválidos (IMC: ${imc.toStringAsPrecision(4)})';
      }
    });
  }

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
            onPressed: _resetField,
            iconSize: 30,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_pin, size: 120, color: Colors.green),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                      labelText: "Peso (kg):",
                      labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
                  controller: weightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira seu peso";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                      labelText: "Altura (cm):",
                      labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
                  controller: heightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira sua altura";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _caluloIMC();
                          }
                        },
                        child: Text("Calcular",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        color: Colors.green,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text(
                    "$_infoText",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
