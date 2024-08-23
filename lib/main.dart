import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: TextToSpeech()
      )
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final variable = 2;
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text) async {
    await flutterTts.setLanguage('en_US');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      child: Padding(
        padding: EdgeInsets.all(32),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            TextFormField(
              controller: textEditingController,
            ),

            ElevatedButton(
              onPressed: () => speak(textEditingController.text), 
              child: Text('Start tts')
            )
          ],
        )
      )
    );
  }
}