import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valentines Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Valentines Challenge'),
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
  bool _initialImage = true;

  void _heartBeat() {
    setState(() {
      _initialImage = !_initialImage;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _initialImage = !_initialImage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
            _initialImage
                ? 'https://th.bing.com/th/id/R.42a9481e03b7893823e7a3847c0bbbf9?rik=tLwpxq5JFnhcug&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fheart-png--3100.png&ehk=2M42CKcKtwjcq9m8G0HDphO94SYXbpsF5MZmUqTPHy0%3d&risl=&pid=ImgRaw&r=0'
                : 'https://th.bing.com/th/id/R.42a9481e03b7893823e7a3847c0bbbf9?rik=tLwpxq5JFnhcug&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fheart-png--3100.png&ehk=2M42CKcKtwjcq9m8G0HDphO94SYXbpsF5MZmUqTPHy0%3d&risl=&pid=ImgRaw&r=0',
            width: _initialImage ? 150 : 200,
          ),
          ElevatedButton(onPressed: _heartBeat, child: const Text("Heartbeat")),
        ]),
      ),
    );
  }
}
