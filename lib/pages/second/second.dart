import 'package:app1/pages/home/homeController.dart';
import 'package:app1/pages/second/secondController.dart';
import 'package:app1/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends StatelessWidget {
  //final HomeController homeController = Get.put(HomeController());
  final SecondController secondController = Get.put(SecondController());

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
              Obx(() => Text(
                    "Second page, welcome " +
                        secondController.myUser.value.name +
                        " " +
                        secondController.myUser.value.surname +
                        "(" +
                        secondController.myUser.value.id.toString() +
                        ")",
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(0, 0, 0, 1)),
                  )),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    print("button pressed");
                    secondController.changeName();
                  },
                  child: Text("isim")),

              /*Text(
                "This is a cupertino style page. Counter=" +
                    homeController.counter.value.toString(),
                style: TextStyle(fontSize: 16, color: colorPrimary),
              ),*/

              //gif - from url  :)
              /*Image.network(
                'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
                height: 200,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              ),*/
              Image.asset(
                "images/owl.jpeg",
                height: 100,
              ),
              //RenderBox was not laid out: RenderRepaintBoundary#8fa18 relayoutBoundary=up4 NEEDS-PAINT
              //The problem is that you are placing the ListView inside a Column/Row.
              Container(
                height: 200,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: secondController.entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber[secondController.colorCodes[index]],
                        child: Center(
                            child: Text(
                                'Entry ${secondController.entries[index]}',
                                style: TextStyle(
                                    fontSize: 16, color: colorPrimary))),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
