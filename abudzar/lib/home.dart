import 'package:abuzar/form.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text("BARBERSHOP"),
        ),
        body: Container(
            child: GridView.count(crossAxisCount: 2, children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormPage()));
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/img/gunting.png",
                      height: 150.0,
                    ),
                    Text("Gunting", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          )
        ])));
  }
}
