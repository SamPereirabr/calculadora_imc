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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

//Função para limpar os campos

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      //Mudar a informação
      _infoText = "Informe seus dados";
    });


// Função para Cálculo
  }
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      //Double Parse para mudar para Inteiro
      double height = double.parse(heightController.text)/100;
      double imc = weight / (height* height);

      if (imc <= 18.5){_infoText = "Abaixo do IMC $imc";}
      //String Precision = 3 casas decimais
      else if (imc <= 18.5 && imc >=23.0){_infoText = "É um peso baixo, seu  IMC é (${(imc.toStringAsPrecision(3))})";}
      else if (imc <= 23.0 && imc >=25.0){_infoText = "O seu ${imc.toStringAsPrecision(3)} é ideal!  ";}
      else if (imc <= 25 && imc >= 30){_infoText = "Seu  IMC ${imc.toStringAsPrecision(3)} corresponde a Obesidade Grau I ";}
      else if (imc <= 30 && imc >= 35){_infoText = "Seu  IMC ${imc.toStringAsPrecision(3)} corresponde a Obesidade Grau II ";}
      else if (imc >= 35){_infoText = "Seu IMC ${(imc.toStringAsPrecision(3))} corresponde a Obesidade Mórbida ";}
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      //Single Scrow para evitar o tamanho excessivo de Campos
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Icon(Icons.person_outline, size: 120.0, color: Colors.blue),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso(kg)",
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, color: Colors.blue),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, color: Colors.blue),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  onPressed: _calculate,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
