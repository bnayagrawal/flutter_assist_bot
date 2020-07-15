
import 'iresponse.dart';

class UserResponse implements IResponse {

  final String message;
  final DateTime timeStamp;

  UserResponse(this.message) : timeStamp = DateTime.now();
}