// filepath: lib/main.dart
import 'package:flutter/material.dart';
import 'conversor_celsius_fahrenheit.dart';
import 'calculadora_media.dart';
import 'calculadora_desconto.dart';
import 'jogo_adivinhacao.dart';
import 'calculadora_area_retangulo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercícios Flutter',
      home: HomeScreen(),
      routes: {
        '/conversor': (context) => ConversorCelsiusFahrenheit(),
        '/media': (context) => CalculadoraMedia(),
        '/desconto': (context) => CalculadoraDesconto(),
        '/jogo': (context) => JogoAdivinhacao(),
        '/area': (context) => CalculadoraAreaRetangulo(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercícios Flutter')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Conversor de Celsius para Fahrenheit'),
            onTap: () => Navigator.pushNamed(context, '/conversor'),
          ),
          ListTile(
            title: Text('Calculadora de Média Aritmética'),
            onTap: () => Navigator.pushNamed(context, '/media'),
          ),
          ListTile(
            title: Text('Calculadora de Desconto'),
            onTap: () => Navigator.pushNamed(context, '/desconto'),
          ),
          ListTile(
            title: Text('Jogo de Adivinhação Simples'),
            onTap: () => Navigator.pushNamed(context, '/jogo'),
          ),
          ListTile(
            title: Text('Calculadora de Área de um Retângulo'),
            onTap: () => Navigator.pushNamed(context, '/area'),
          ),
        ],
      ),
    );
  }
}
