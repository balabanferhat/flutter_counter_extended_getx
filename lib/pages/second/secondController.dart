import 'package:app1/models/user_model.dart';
import 'package:get/get.dart';

class SecondController extends GetxController {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  var myUser = User(name: "", surname: "", id: 0).obs;

  @override
  void onInit() {
    print("SecondController onInit");
    myUser.value.name = "Ferhat";
    myUser.value.surname = "Balaban";
    myUser.value.id = 1;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    print("SecondController onClose");
    // TODO: implement onClose
    super.onClose();
  }
}
