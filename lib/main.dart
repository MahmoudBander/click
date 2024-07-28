// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TextApp(),
    );
  }
}

class TextApp extends StatefulWidget {
  const TextApp({super.key});

  @override
  State<TextApp> createState() => _TextAppState();
}

class _TextAppState extends State<TextApp> {
  String myText = "";
  final mycontroller = TextEditingController();

  myfunc() {
    setState(() {
      myText = mycontroller.text;
    });
  }



@override
void initState() {
   super.initState();
   // Start listening to changes.
   mycontroller.addListener(myfunc);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Handle changes to a text field",
          style: TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(hintText: "What is ur name"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              myfunc();
            },
            child: Text(
              "click here",
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ))),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "My Name is :  $myText ",
            style: TextStyle(fontSize: 27),
          ),
        ],
      ),
    );
  }
}
