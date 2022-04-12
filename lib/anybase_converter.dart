class AnyBaseConverter {
  static const BIN = '01';
  static const OCT = '01234567';
  static const DEC = '0123456789';
  static const HEX = '0123456789abcdef';

  String srcAlphabet;
  String dstAlphabet;
  AnyBaseConverter(
      {this.srcAlphabet = AnyBaseConverter.DEC,
      this.dstAlphabet = AnyBaseConverter.HEX}) {
    if ((srcAlphabet.isEmpty) || (dstAlphabet.isEmpty)) {
      throw Exception('Bad alphabet');
    }
    this.srcAlphabet = srcAlphabet;
    this.dstAlphabet = dstAlphabet;
  }

  bool isValid(dynamic number) {
    var i = 0;
    for (; i < number.length; ++i) {
      if (!srcAlphabet.contains(number[i])) {
        return false;
      }
    }
    return true;
  }

  dynamic convert(dynamic number) {
    number = number.toString();
    var i,
        divide,
        newlen,
        numberMap = {},
        fromBase = srcAlphabet.length,
        toBase = dstAlphabet.length,
        length = number.length,
        result = number.runtimeType == String ? '' : [];

    if (!isValid(number)) {
      throw Exception('Number "' +
          number +
          '" contains of non-alphabetic digits (' +
          srcAlphabet +
          ')');
    }

    if (srcAlphabet == dstAlphabet) {
      return number;
    }

    for (i = 0; i < length; i++) {
      numberMap[i] = srcAlphabet.indexOf(number[i]);
    }
    do {
      divide = 0;
      newlen = 0;
      for (i = 0; i < length; i++) {
        divide = divide * fromBase + numberMap[i];
        if (divide >= toBase) {
          numberMap[newlen++] = (divide / toBase).toInt();
          divide = divide % toBase;
        } else if (newlen > 0) {
          numberMap[newlen++] = 0;
        }
      }
      length = newlen;
      result = dstAlphabet.substring(divide, divide + 1) + result.toString();
    } while (newlen != 0);

    return result;
  }
}
