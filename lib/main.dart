import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:book_reader_4_week/pooh_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int fontSize = 14;
  String mainText = '$chapter1';

  void minusSize() {
    if (fontSize > 6) {
      setState(() {
        fontSize--;
      });
    }
  }

  void plusSize() {
    if (fontSize < 60) {
      setState(() {
        fontSize++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Читалка",
            style: TextStyle(color: Color.fromARGB(255, 255, 196, 0)),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 254, 255, 171),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  mini: true,
                  tooltip: 'Уменьшить',
                  onPressed: () {
                    minusSize();
                  },
                  child: const Icon(Icons.remove),
                ),
                Container(
                  width: 140,
                  height: 40,
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: TextEditingController()
                      ..text = fontSize.toString(),
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                        labelText: "Размер шрифта",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 253, 190, 0),
                            fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 248, 223, 112)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    onSubmitted: (String font) {
                      int newFont = int.parse(font);
                      if (newFont > 6 && newFont < 60) {
                        setState(() {
                          fontSize = newFont;
                        });
                      }
                    },
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  mini: true,
                  tooltip: 'Увеличить',
                  onPressed: () {
                    plusSize();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    mainText = chapter1;
                    setState(() {});
                  },
                  child: Text("Глава 1"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    mainText = chapter2;
                    setState(() {});
                  },
                  child: Text("Глава 2"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    mainText = chapter3;
                    setState(() {});
                  },
                  child: Text("Глава 3"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text('$mainText',
                      style: TextStyle(
                          fontSize: fontSize.toDouble(),
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
