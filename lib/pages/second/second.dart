import 'package:flutter/cupertino.dart';

class Second extends StatefulWidget {
  Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Second page"),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Second page",
            style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ));
  }
}
