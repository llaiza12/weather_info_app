import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,

        // Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
      home: const MyHomePage(title: 'Calculator'),
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
  String userDisplayText = "0"; // display text

  // parses expression and returns result
  int extractResultFromString(String expression) {
    try {
      final parsedExpression = Expression.parse(expression);
      final evaluator = const ExpressionEvaluator();
      final result = evaluator.eval(parsedExpression, {});
      return result.toInt();
    } catch (e) {
      // catches errors and returns '0'
      return 0;
    }
  }

  // called when user presses "=" button. solves expression and displays result to user
  void solve() {
    setState(() {
      final result = extractResultFromString(userDisplayText);
      userDisplayText = result.toString();
    });
  }

  // displays text to user
  void onButtonPressed(String userInput) {
    setState(() {
      if (userDisplayText == "0") {
        userDisplayText = userInput;
      } else {
        userDisplayText += userInput;
      }
    });
  }

  // resets calculator
  void clear() {
    setState(() {
      userDisplayText = "0";
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display Area
            Container(
              padding: EdgeInsets.all(20),
              width: 400,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.centerRight,
              child: Text(
                userDisplayText,
                style: TextStyle(
                  background: Paint()..color = Colors.grey,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),

            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: clear,
                  child: Text("C"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("0"),
                  child: const Text("0"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("/"),
                  child: const Text("÷"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("*"),
                  child: const Text("x"),
                ),
              ],
            ),

            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed("7"),
                  child: Text("7"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("8"),
                  child: const Text("8"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("9"),
                  child: const Text("9"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("-"),
                  child: const Text("-"),
                ),
              ],
            ),

            // Third Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed("4"),
                  child: Text("4"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("5"),
                  child: const Text("5"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("6"),
                  child: const Text("6"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("+"),
                  child: const Text("+"),
                ),
              ],
            ),

            // Fourth Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed("1"),
                  child: Text("1"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("2"),
                  child: const Text("2"),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed("3"),
                  child: const Text("3"),
                ),
                ElevatedButton(
                  onPressed: solve,
                  child: const Text("="),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
