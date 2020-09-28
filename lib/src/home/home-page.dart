import 'package:flutter/material.dart';
import 'package:teste_moor/src/contato/ContatoWidget.dart';

class MyHomePage extends StatefulWidget {
  final String title = 'Teste';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.contacts),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContatoWidget();
                }));
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Comece adicionando produtos!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
