library shortuuid;

import 'package:shortuuid/anybase_converter.dart';
import 'package:uuid/uuid.dart';

class ShortUuid {
  static const flickrBase58 =
      '123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';
  static const cookieBase90 =
      "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!#\$%&'()*+-./:<=>?@[]^_`{|}~";

  static String shortv4(
      {Map<String, dynamic>? options,
      String? uuidv4,
      String toAlphabet = flickrBase58}) {
    uuidv4 = uuidv4 == null ? Uuid().v4(options: options) : uuidv4;

    var fromHex = AnyBaseConverter(
        srcAlphabet: AnyBaseConverter.HEX, dstAlphabet: toAlphabet);

    return fromHex.convert(uuidv4.toLowerCase().replaceAll(RegExp(r'-'), ''));
  }

  static String toUuidv4(String shortUuid, {String toAlphabet = flickrBase58}) {
    var toHex = AnyBaseConverter(
        srcAlphabet: toAlphabet, dstAlphabet: AnyBaseConverter.HEX);
    String strUuidv4 = toHex.convert(shortUuid);
    var leftPad = '';
    var m = <String>[];

    for (var i = 0, len = 32 - strUuidv4.length; i < len; ++i) {
      leftPad += '0';
    }

    var exp = RegExp(r'(\w{8})(\w{4})(\w{4})(\w{4})(\w{12})');
    Iterable<Match> matches = exp.allMatches(leftPad + strUuidv4);

    if (matches.isNotEmpty) {
      var match = matches.first;
      for (var i = 1; i <= match.groupCount; i++) {
        String? matchStr = match.group(i);
        if (matchStr != null) {
          m.add(matchStr);
        }
      }
    }
    return [m[0], m[1], m[2], m[3], m[4]].join('-');
  }
}
