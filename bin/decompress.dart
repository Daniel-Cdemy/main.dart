import 'package:main_dart/compress_functions.dart';

void main(List<String> arguments) {
  final result = <String>[];
  for (final argument in arguments) {
    result.add(decompress(argument));
  }
  print(result);
}
