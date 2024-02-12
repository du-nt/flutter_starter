import '../helpers/http_delegate.dart';
import 'model/todo_model.dart';

class RemoteDataSource with HttpDelegate {
  Future<void> getTodos() async {
    try {
      final response = await getRequest('users/1/todos?_limit=15');

      final a = response.map((cat) => Todo.fromJson(cat)).toList();
      return a;
    } catch (e) {
      print(e.toString());
    }
  }
}
