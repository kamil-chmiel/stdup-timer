import 'package:uuid/uuid.dart';

class Participant {
  String id;
  String name;
  bool isPresent;

  Participant(this.name, this.isPresent) {
    id = Uuid().v4();
  }
}
