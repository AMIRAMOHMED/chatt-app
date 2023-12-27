import '../constants.dart';

class Messages {
  final String id;
  final String message;

  Messages(this.message, this.id);

  factory Messages.fromJson(jsonData) {
    return Messages(jsonData[kMessage], jsonData["id"]);
  }
}
