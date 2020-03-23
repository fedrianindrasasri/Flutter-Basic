// import package
import 'package:flutter/material.dart';

void main() {
  // merender kode kedalam screeen aplikasi, yaitu HomePage
  runApp(HomePage());
}

// definisikan class HomePage
class HomePage extends StatelessWidget {
  build(context) {
    // Scaffold widget inilah yang memiliki property appBar untuk membuat bar dari sebuah aplikasi
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red[800],
              leading: Icon(Icons.home),
              title: Text('Fluuter Basic'),
            ),

            /*
            
            */
            body: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.archive),
                    Text('Artikel Terbaru',
                        style: new TextStyle(fontWeight: FontWeight.bold))
                  ]),
                  Card(
                    child: Column(children: <Widget>[
                      Image.network(
                          'https://flutter.io/images/homepage/header-illustration.png'),
                      Text('Belajar Flutter'),
                    ]),
                  ),
                ]))));
  }
}
