import 'package:app1/pages/home/homeController.dart';
import 'package:app1/pages/second/second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Expanded(
                child: Text(
                  'COUNTER',
                  style: TextStyle(fontSize: 26),
                ),
                flex: 1,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Text(
                    'EXAMPLE',
                    style: TextStyle(fontSize: 26),
                  ),
                  flex: 2),
            ]),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 10),
              //color: Colors.amber, // cannot be used with decoration
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(() => Text(
                  'You have pushed the button this many times:' +
                      homeController.counter.value.toString(),
                )),
            ElevatedButton(
              //With ButtonStyle() you've to define all the required properties and
              //with ButtonStyle.styleFrom() picks the default set values and you only change the required values.
              style:
                  ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 22)),
              onPressed: () {
                print("ElevatedButton pressed");
                /*final snackBar = SnackBar(
                  content: Text('ElevatedButton pressed'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                */
                Get.snackbar("title", "ElevatedButton pressed",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text('ElevatedButton'),
            ),
            TextButton(
              //With ButtonStyle() you've to define all the required properties and
              //with ButtonStyle.styleFrom() picks the default set values and you only change the required values.
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 22)),
              onPressed: () {
                print("TextButton pressed");
                final snackBar = SnackBar(
                  content: Text('TextButton pressed'),
                  duration: Duration(seconds: 1),
                  action: SnackBarAction(
                    label: 'Action',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('TextButton'),
            ),
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('AlertDialog Title'),
                  content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('Alert Dialog'),
            ),
            TextButton(
              onPressed: () => Get.defaultDialog(
                title: "test",
                middleText: "Hello world!",
                backgroundColor: Colors.green,
                titleStyle: TextStyle(color: Colors.white),
                middleTextStyle: TextStyle(color: Colors.white),
              ),
              child: const Text('Alert Dialog2'),
            ),
            Expanded(
              child: OutlinedButton(
                //With ButtonStyle() you've to define all the required properties and
                //with ButtonStyle.styleFrom() picks the default set values and you only change the required values.
                style: OutlinedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 22)),
                onPressed: () {
                  print("Expanded OutlinedButton pressed");
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Second()),
                  );*/
                  //Get.to(Second()); // old way
                  Get.to(() => Second());
                },
                child: const Text('Expanded OutlinedButton ->2.page'),
              ),
            ),
          ],
        ),
      ),
      /* 
      2 fab btn error after navigating to another screen
      err:  There are multiple heroes that share the same tag within a subtree
      solution: we had to add a heroTag property per FloatingActionButton 
      in order for the error to go away. 
      */

      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          onPressed: homeController.incrementCounter,
          tooltip: 'Increment',
          heroTag: "btn1_inc",
          child: Icon(Icons.add),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            onPressed: homeController.decrementCounter,
            tooltip: 'Decrement',
            heroTag: "btn2_dec",
            child: Icon(Icons.remove)),
      ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
