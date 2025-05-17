import 'package:flutter/material.dart';

class CalculadoraAreaRetangulo extends StatefulWidget {
  @override
  _CalculadoraAreaRetanguloState createState() =>
      _CalculadoraAreaRetanguloState();
}

class _CalculadoraAreaRetanguloState extends State<CalculadoraAreaRetangulo> {
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double? _area;

  void _calcularArea() {
    setState(() {
      double largura = double.tryParse(_larguraController.text) ?? 0;
      double altura = double.tryParse(_alturaController.text) ?? 0;
      _area = largura * altura;
    });
  }

  @override
  void dispose() {
    _larguraController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Área do Retângulo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _larguraController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Largura'),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularArea,
              child: const Text('Calcular Área'),
            ),
            if (_area != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Área: ${_area!.toStringAsFixed(2)}'),
              )
          ],
        ),
      ),
    );
  }
}
