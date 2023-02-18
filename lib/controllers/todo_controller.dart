import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist_getx/models/todo.dart';

class TodoController extends GetxController {
  var todo = [].obs;

  @override
  void onInit() {
    var gettodo = GetStorage().read('todo');
    if (gettodo != null) {
     todo = RxList(gettodo.map((e) => Todo.fromJson(e)).toList());
    }

    ever(todo, (callback) {
      GetStorage().write('todo', todo.toList());
    });
    super.onInit();
  }
}
