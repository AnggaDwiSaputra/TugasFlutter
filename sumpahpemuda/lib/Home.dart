import 'package:flutter/material.dart';
import 'Detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarPahlawan = new List();

  var karakter = [
    {"nama": "a.k gani", "gambar": "a.k gani.jpg"},
    {"nama": "amir sjarifuddin", "gambar": "amir sjarifuddin.jpg"},
    {"nama": "djoko marsaid", "gambar": "djoko marsaid.jpg"},
    {"nama": "kartosoewirjo", "gambar": "kartosoewirjo.jpg"},
    {"nama": "kasman singodimedjo", "gambar": "kasman singodimedjo.jpg"},
    {"nama": "ki sarmidi mangunsarkoro", "gambar": "ki sarmidi mangunsarkoro.jpg"},
    {"nama": "mohammad roem", "gambar": "mohammad roem.jpg"},
    {"nama": "mohammad yamin", "gambar": "mohammad yamin.jpg"},
    {"nama": "sie kong liong", "gambar": "sie kong liong.jpg"},
    {"nama": "soegondo", "gambar": "soegondo.jpg"},
    {"nama": "soenaryo", "gambar": "soenaryo.jpg"},
  ];
  

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarPahlawan.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: karakternya['nama'],
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                nama: karakternya['nama'],
                                gambar: gambar,
                              ),
                            )),
                        child: new Image.asset(
                          "img/$gambar",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                  ),
                  new Text(
                    karakternya['nama'],
                    style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                  )
                ],
              ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Daftar Nama Para Pahlawan",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarPahlawan,
      ),
    );
  }
}
