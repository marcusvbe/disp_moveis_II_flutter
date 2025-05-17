import 'package:flutter/material.dart';

class CalculadoraDesconto extends StatefulWidget {
  @override
  _CalculadoraDescontoState createState() => _CalculadoraDescontoState();
}

class _CalculadoraDescontoState extends State<CalculadoraDesconto> {
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _descontoController = TextEditingController();
  double? _precoFinal;
  final List<String> _produtos = [];

  void _calcularDesconto() {
    setState(() {
      double preco = double.tryParse(_precoController.text) ?? 0;
      double desconto = double.tryParse(_descontoController.text) ?? 0;
      _precoFinal = preco - (preco * desconto / 100);
      _produtos.add(
          'Produto: Preço original R\$${preco.toStringAsFixed(2)}, Desconto ${desconto.toStringAsFixed(1)}%, Final R\$${_precoFinal!.toStringAsFixed(2)}');
    });
  }

  @override
  void dispose() {
    _precoController.dispose();
    _descontoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Desconto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço Original'),
            ),
            TextField(
              controller: _descontoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Desconto (%)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularDesconto,
              child: const Text('Calcular Desconto'),
            ),
            if (_precoFinal != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child:
                    Text('Preço Final: R\$${_precoFinal!.toStringAsFixed(2)}'),
              ),
            const Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: _produtos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_produtos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
