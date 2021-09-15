import 'package:get/get.dart';

class HomeController extends GetxController {
  var counter = 0.obs;

  @override
  void onInit() {
    counter.value = 3;
    print("HomeController onInit");
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    print("HomeController onClose");
    // TODO: implement onClose
    super.onClose();
  }

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter() {
    if (counter.value > 0) {
      counter.value--;
    } else {
      //todo:show alert dialog
    }
  }
}
