import 'package:flutter/material.dart';

class ConversorCelsiusFahrenheit extends StatefulWidget {
  @override
  _ConversorCelsiusFahrenheitState createState() =>
      _ConversorCelsiusFahrenheitState();
}

class _ConversorCelsiusFahrenheitState
    extends State<ConversorCelsiusFahrenheit> {
  final TextEditingController _controller = TextEditingController();
  double? _resultado;

  void _converter() {
    setState(() {
      double celsius = double.tryParse(_controller.text) ?? 0;
      _resultado = (celsius * 9 / 5) + 32;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversor Celsius/Fahrenheit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Temperatura em Celsius'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _converter,
              child: const Text('Converter'),
            ),
            if (_resultado != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Temperatura em Fahrenheit: $_resultado'),
              )
          ],
        ),
      ),
    );
  }
}
