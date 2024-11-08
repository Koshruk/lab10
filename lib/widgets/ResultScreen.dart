import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final spacer = const SizedBox(
    height: 20,
  );

  final String text;
  final double fontSize;

  const ResultScreen({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Result",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
            ),
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context, 1),
                  },
                  child: const Text("OK"),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                    onPressed: () => {
                      Navigator.pop(context, 2),
                    },
                    child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
