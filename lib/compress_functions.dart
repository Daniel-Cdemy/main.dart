String compress(String uncompressed) {
  if (!isValidRawString(uncompressed)) return '';
  var result = '';
  String? currentChar;
  var currentCharcount = 0;
  for (var i = 0; i < uncompressed.length; i++) {
    final char = uncompressed.substring(i, i + 1);
    if (char == currentChar) {
      currentCharcount++;
    } else {
      result += compressPart(currentChar, currentCharcount);
      currentChar = char;
      currentCharcount + 1;
    }
  }
  result += compressPart(currentChar, currentCharcount);
  return result;
}

String decompress(String compressed) {
  var result = '';
  String? lastChar;
  int multiplicator = 0;
  for (var i = 0; i < compressed.length; i++) {
    final element = compressed.substring(i, i + 1);
    if (int.tryParse(element) == null) {
      result += decompressPart(lastChar, multiplicator);
      lastChar = element;
      multiplicator = 0;
    } else {
      multiplicator = multiplicator * 10 + int.parse(element);
    }
  }
  result += decompressPart(lastChar, multiplicator);
  return result;
}

String decompressPart(String? char, int multiplicator) {
  if (char == null) return '';
  final realMultiplicator = multiplicator == 0 ? 1 : multiplicator;
  var result = '';
  for (var i = 0; i < realMultiplicator; i++) {
    result += char;
  }
  return result;
}

String compressPart(String? char, int count) {
  if (char == null) return '';
  if (count < 1) return '';
  if (count == 1) return char;
  if (count == 2) return '$char$char';
  return '$char$count';
}

bool isValidRawString(String raw) {
  for (var i = 0; i < raw.length; i++) {
    if (int.tryParse(raw.substring(i, i + 1)) != null) {
      return false;
    }
  }
  return true;
}
