import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(DigitalQuran());
}

class DigitalQuran extends StatefulWidget {
  DigitalQuranState createState() => DigitalQuranState();
}

class DigitalQuranState extends State<DigitalQuran> {
  @override
  void initState() {
    super.initState();
    // memanggil func get data
    this.getData();
  }

  final String url = 'https://api.banghasan.com/quran/format/json/surat';

  //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY
  List data;

  Future<String> getData() async {
    // mengambil data ke server dengan ketentauan yang di Accept oleh json
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      // respon dari api tersebut di decode
      var content = json.decode(res.body);

      // data yang telah di decode disimpan kedalam var data
      // dan data yang akan diambil adalah isi dari key hasil
      data = content['hasil'];
    });
    return 'success';
  }

  Widget build(context) {
    return MaterialApp(
      title: 'Digital Quran',
      home: Scaffold(
          appBar: AppBar(title: Text('Digital Quran')),
          body: Container(
            // margin dari container
            margin: EdgeInsets.all(10.0),
            // membuat list view
            child: ListView.builder(
              // jika datanya kosong maka kita isi dengan 0, jika ada data maka count data yang ada
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // list tile mengelompokkan widget menjadi beberapa bagian
                      ListTile(
                        // leading mengelompokkan widget menjadi beberapa bagian
                        // value dari leading adalah widget Text yang berisi nomor surah
                        leading: Text(
                          data[index]['nomor'],
                          style: TextStyle(fontSize: 30.0),
                        ),

                        // title akan tampil ditengah setelah leading
                        // valuenya wiget text dengan nama surah
                        title: Text(
                          data[index]['nama'],
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),

                        // trailing akan tampil pada sebelah kanan setelah title
                        // valuenya adalah image, ketika valuenya mekah maka akan menampilkan mekah.jpg
                        // selain dari itu akan menampilkan madinah.jpg
                        trailing: Image.asset(
                          data[index]['type'] == 'mekah'
                              ? 'mekah.jpg'
                              : 'madinah.png',
                          width: 32.0,
                          height: 32.0,
                        ),

                        // subtitle tampil tepat dibawah title
                        subtitle: Column(
                          children: <Widget>[
                            // menggunakan colomn dima amasing-masing terdapat row
                            Row(
                              children: <Widget>[
                                // menampilkan text arti
                                Text(
                                  'Arti : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['arti'],
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15.0),
                                )
                              ],
                            ),

                            // row untuk menampilkan jumlah ayat
                            Row(
                              children: <Widget>[
                                Text(
                                  'Jumlah Ayat : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(data[index]['ayat'])
                              ],
                            ),

                            // menamilkan dimana surah tersebut turun
                            Row(
                              children: <Widget>[
                                Text(
                                  'Diturunkan : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(data[index]['type'])
                              ],
                            ),
                          ],
                        ),
                      ),

                      // membuat button
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            //button pertama
                            FlatButton(
                              child: const Text('Lihat Detail'),
                              onPressed: () {/* */},
                            ),
                            // button kedua
                            FlatButton(
                              child: const Text('Lihat Detail'),
                              onPressed: () {/* */},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              },
            ),
          )),
    );
  }
}
