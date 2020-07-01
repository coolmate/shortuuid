import 'package:shortuuid/shortuuid.dart';

void main() {

  //create shorter version of uuid:
  var shortUuid = ShortUuid.shortv4();
  print(shortUuid);

  //related full uuid v4
  var fullUuid = ShortUuid.toUuidv4(shortUuid);
  print(fullUuid);

}