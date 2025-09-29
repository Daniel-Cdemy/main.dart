void main(List<String> arguments) {
  if (arguments.isNotEmpty) {
    print('Hallo ${arguments.join(' ')}!');
  } else {
    print('Hallo!');
  }
}
