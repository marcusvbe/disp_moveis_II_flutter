import 'package:flutter/material.dart';

class CalculadoraMedia extends StatefulWidget {
  @override
  _CalculadoraMediaState createState() => _CalculadoraMediaState();
}

class _CalculadoraMediaState extends State<CalculadoraMedia> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  double? _media;

  void _calcularMedia() {
    setState(() {
      double nota1 = double.tryParse(_nota1Controller.text) ?? 0;
      double nota2 = double.tryParse(_nota2Controller.text) ?? 0;
      double nota3 = double.tryParse(_nota3Controller.text) ?? 0;
      _media = (nota1 + nota2 + nota3) / 3;
    });
  }

  @override
  void dispose() {
    _nota1Controller.dispose();
    _nota2Controller.dispose();
    _nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Média Aritmética')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 1'),
            ),
            TextField(
              controller: _nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 2'),
            ),
            TextField(
              controller: _nota3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 3'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularMedia,
              child: const Text('Calcular Média'),
            ),
            if (_media != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Média: ${_media!.toStringAsFixed(2)}'),
              )
          ],
        ),
      ),
    );
  }
}
