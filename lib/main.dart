import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Probando Stack en Scaffold',
      theme: ThemeData(
        // This is the theme of your application.

        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Probando Stack en Scaffold'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      if (_contador > 2) {
        _contador = 0;
      } else {
        _contador++;
      }
    });
  }

  void _decrementarContador() {
    setState(() {
      _contador = _contador < 0 ? 2 : _contador - 1; // el mismo if restando pero probando un if ternario
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              alignment: Alignment.center, //Ajustotodo al centro
              children: [
                Image.asset('assets/img/Start.jpg',
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover //Ajusto al tamaño
                    //
                    ),
                if (_contador >= 1)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.asset(
                      'assets/img/Typing.jpg',
                      width: 200,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (_contador >= 2)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.asset(
                      'assets/img/DontLoseYourHead.jpg',
                      width: 200,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: _decrementarContador,
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _incrementarContador,
              child: Icon(Icons.add),
            ),
          ],
        ),
    );
  }
}
