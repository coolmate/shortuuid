import "package:test/test.dart";
import 'package:shortuuid/shortuuid.dart';
import 'package:uuid/uuid.dart';

void main() {

  group('Test converter', () {
    test('test shortuuid with flickerbase', () {
      var uuidv4 = Uuid().v4();
      print(uuidv4);
      var shortUuid = ShortUuid.shortv4(uuidv4: uuidv4);
      print(shortUuid);
      var reversed = ShortUuid.toUuidv4(shortUuid);
      print(reversed);

      expect(reversed, uuidv4);

    });

    test('test shortuuid with cookie base', () {
      var uuidv4 = Uuid().v4();
      print(uuidv4);
      var shortUuid = ShortUuid.shortv4(uuidv4: uuidv4, toAlphabet: ShortUuid.cookieBase90);
      print(shortUuid);
      var reversed = ShortUuid.toUuidv4(shortUuid, toAlphabet: ShortUuid.cookieBase90);
      print(reversed);

      expect(reversed, uuidv4);

    });

  });

}
