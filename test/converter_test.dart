import "package:test/test.dart";
import 'package:shortuuid/anybase_converter.dart';

void main() {
  var flickrBase58 = '123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';

  group('Test converter', () {
    test('test convert dec to hex', () {
      var converter = AnyBaseConverter();
      var v1 = converter.convert(1);
      expect(v1, '1');
      var v2 = converter.convert(255);
      expect(v2, 'ff');
      var v3 = converter.convert(65535);
      expect(v3, 'ffff');
    });
    test('test convert hex to dec', () {
      var converter = AnyBaseConverter(srcAlphabet: AnyBaseConverter.HEX, dstAlphabet: AnyBaseConverter.DEC);
      var v1 = converter.convert('ff');
      expect(v1, '255');
      var v2 = converter.convert('ffff');
      expect(v2, '65535');
    });

  });

}
