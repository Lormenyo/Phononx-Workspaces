import 'package:hive/hive.dart';
import 'package:workspaces_app/models/workspace_model.dart';

class CachingService {
  final String boxName;
  late Box box;

  CachingService({required this.boxName}) {
    box = Hive.box(this.boxName);
  }

  isExists() async {
    int length = this.box.length;
    return length != 0;
  }

  addWorkspaces(List<dynamic> items) async {
    for (var item in items) {
      this.box.put(item["id"], item);
      // this.box.add(item);
    }
  }

  getWorkspaces() async {
    List boxList = [];

    int length = this.box.length;

    for (int i = 0; i < length; i++) {
      boxList.add(this.box.getAt(i));
    }

    return boxList;
  }

  closeCacheBox() async {
    await this.box.close();
  }
}
