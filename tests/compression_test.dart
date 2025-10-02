import 'package:main_dart/compress_functions.dart';
import 'package:test/test.dart';

void main() {
  test('Komprimierung', () {
    expect(compress(''), '');
    expect(compress('AB'), 'AB');
    expect(compress('AABB'), 'AABB');
    expect(compress('AAABBB'), 'A3B3');
    expect(compress('AAABBCCCCD'), 'A3BBC4D');
  });

  test('Dekomprimierung', () {
    expect(decompress(''), '');
    expect(decompress('AB'), 'AB');
    expect(decompress('AABB'), 'AABB');
    expect(decompress('A3B3'), 'AAABBB');
    expect(decompress('A3BBC4D'), 'AAABBCCCCD');
  });
}
