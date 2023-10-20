import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimation(),
    );
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  double _width = 100.0;
  double _height = 100.0;
  bool _isCircle = false;
  Color _textColor = Colors.black;
  List<Color> colorOptions = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];
  int currentColorIndex = 0;

  void _toggleShapeAnimation() {
    setState(() {
      if (_isCircle) {
        _width = 100.0;
        _height = 100.0;
      } else {
        _width = 200.0;
        _height = 200.0;
      }
      _isCircle = !_isCircle;
    });
  }

  void _changeTextColor() {
    if (currentColorIndex == colorOptions.length - 1) {
      currentColorIndex = 0;
    } else {
      currentColorIndex++;
    }
    setState(() {
      _textColor = colorOptions[currentColorIndex];
    });
  }

  @override
  void initState() {
    super.initState();
    // Configura um temporizador para trocar a cor do texto a cada 2 segundos
    Timer.periodic(Duration(seconds: 2), (timer) {
      _changeTextColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Animação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                shape: _isCircle ? BoxShape.circle : BoxShape.rectangle,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            AnimatedDefaultTextStyle(
              duration: Duration(seconds: 1),
              style: TextStyle(
                fontSize: 20,
                color: _textColor,
              ),
              child: Text('Texto com Cores que Trocam Automaticamente'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleShapeAnimation,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
