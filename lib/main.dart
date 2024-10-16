import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Probando Stack en Scaffold',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Probando Stack en Scaffold'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de imágenes a mostrar
  final List<String> imagenes = [
    'assets/img/Start.jpg',
    'assets/img/Typing.jpg',
    'assets/img/DontLoseYourHead.jpg',
  ];

  // Comienzo con una imagen
  int _cantidadImagenesApiladas = 1;

  void _incrementarContador() {
    setState(() {
      _cantidadImagenesApiladas++;
    });
  }

  // Como trabajo con pilas no puedo tener valores negativos , elijo que minimo muestre una imagen
  void _decrementarContador() {
    setState(() {
      if (_cantidadImagenesApiladas > 1) {
        _cantidadImagenesApiladas--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                for (int i = 0; i < _cantidadImagenesApiladas; i++) // Cada iteración del bucle construye y devuelve un nuevo widget, que se incluye en la lista de hijos del Stack.
                  Positioned(
                    top: 10.0 * i,
                    left: 10.0 * i,
                    child: Image.asset(
                      imagenes[i % imagenes.length],
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            // Ajusta el valor según lo necesario
            child: Text(
              'Contador: $_cantidadImagenesApiladas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          // Espacio adicional entre el texto y los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: _decrementarContador,
                child: Icon(Icons.remove),
              ),
              SizedBox(width: 20), // Espacio entre los botones
              FloatingActionButton(
                onPressed: _incrementarContador,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
