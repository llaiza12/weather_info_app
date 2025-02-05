import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  // use this method to change the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),

      // standard dark theme
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Demo '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose the Theme:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Create two buttons here and change the theme when the button is pressed. use children [] and create two button inside it.

                children: [
                  // light theme button
                  TextButton(
                    onPressed: () => changeTheme(ThemeMode.light),
                    child: Text('Light Theme'),
                  ),

                  // dark theme button
                  TextButton(
                    onPressed: () => changeTheme(ThemeMode.dark),
                    child: Text('Dark Theme'),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  // change colors
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey
                      : Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 350,
                width: 350,
                alignment: Alignment.center,
                child: Text(
                  'Mobile App Development Testing',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
