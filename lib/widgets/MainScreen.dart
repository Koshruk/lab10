import 'package:flutter/material.dart';
import 'package:lab10/widgets/ResultScreen.dart';


class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  final spacer = const SizedBox(
    height: 20,
  );

  double _fontSize = 14.0;

  final TextEditingController _mainController = TextEditingController();

  void _onFontChanged(double value){
    setState(() {
      _fontSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Text previewer",
        ),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _mainController,
              decoration: const InputDecoration(
                labelText: "Text",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            spacer,
            Row(
              children: [
                const Text("Font size: ", style: TextStyle(fontSize: 15),),
                Text(_fontSize.toStringAsFixed(0), style: const TextStyle(fontSize: 15),),
                Expanded(
                  child:
                    Slider(value: _fontSize, min: 1, max: 60, onChanged: _onFontChanged),
                ),
             ],
            ),
            spacer,
            ElevatedButton(
              onPressed: () async
              {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(text: _mainController.text, fontSize: _fontSize),
                  ),
                );
                if(result == 1){
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx) => _backAlert("Cool!"),
                  );
                }
                else if (result == 2){
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx) => _backAlert("Let's try something else"),
                  );
                }
                else{
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx) => _backAlert("Don't know what to say"),
                  );
                }
              },
              child: const Text(
                "Preview",
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _backAlert(String text){
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/Robot_Emoji_Icon.png',
            height: 50,
          ),
          spacer,
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          spacer,
          Align(
            alignment: Alignment.bottomRight,
            child:
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
              },
              child: const Text("OK"),
            ),
          ),
        ],
      ),
    );
  }
}