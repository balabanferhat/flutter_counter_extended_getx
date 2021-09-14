import 'package:app1/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Second page",
                style:
                    TextStyle(fontSize: 25, color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              SizedBox(height: 40),
              Text(
                "This is a cupertino style page",
                style: TextStyle(fontSize: 16, color: colorPrimary),
              ),
              Image.network(
                'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
                height: 200,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              ),
              Image.asset(
                "images/owl.jpeg",
                height: 200,
              )
            ],
          ),
        ));
  }
}
