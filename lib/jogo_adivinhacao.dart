import 'dart:math';
import 'package:flutter/material.dart';

class JogoAdivinhacao extends StatefulWidget {
  @override
  _JogoAdivinhacaoState createState() => _JogoAdivinhacaoState();
}

class _JogoAdivinhacaoState extends State<JogoAdivinhacao> {
  final TextEditingController _controller = TextEditingController();
  final int _numeroSecreto = Random().nextInt(10) + 1;
  String _mensagem = '';
  int _tentativasRestantes = 3;

  void _adivinhar() {
    setState(() {
      if (_tentativasRestantes > 0) {
        int palpite = int.tryParse(_controller.text) ?? 0;
        if (palpite == _numeroSecreto) {
          _mensagem = 'Parabéns! Você acertou!';
        } else {
          _tentativasRestantes--;
          if (palpite < _numeroSecreto) {
            _mensagem =
                'Muito baixo! Tentativas restantes: $_tentativasRestantes';
          } else {
            _mensagem =
                'Muito alto! Tentativas restantes: $_tentativasRestantes';
          }
          if (_tentativasRestantes == 0) {
            _mensagem = 'Fim de jogo! O número era $_numeroSecreto';
          }
        }
      }
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
      appBar: AppBar(title: const Text('Jogo de Adivinhação')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Digite um número de 1 a 10'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _adivinhar,
              child: const Text('Chutar'),
            ),
            const SizedBox(height: 16),
            Text(_mensagem)
          ],
        ),
      ),
    );
  }
}
