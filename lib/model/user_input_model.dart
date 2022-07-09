class UserInput {
  late final List<int> _myNumbers;

  UserInput(List<int> inputNumbers) {
    _validateSize(inputNumbers);
    _validateDuplicate(inputNumbers);
    _myNumbers = inputNumbers;
  }

  List<int> getInput() {
    return _myNumbers;
  }

  _validateSize(List<int> inputNumbers) {
    if (inputNumbers.length != 3) {
      throw UserInputException(inputNumbers);
    }
  }

  _validateDuplicate(List<int> inputNumbers) {
    List<int> inputNumbersWithDeduplication = inputNumbers.toSet().toList();
    if (inputNumbersWithDeduplication.length != 3) {
      throw UserInputException(inputNumbers);
    }
  }
}

class UserInputException implements Exception {
  UserInputException(this.source);

  final List<int> source;

  @override
  String toString() {
    if (source.length != 3) return "입력 된 값이 3개가 아니에요!";

    return "${countDuplicatedValue()}가 같아요! 다른 값을 입력해주세요";
  }

  String countDuplicatedValue() {
    final Map counts = {};

    source.map((e) => counts.containsKey(e) ? counts[e]++ : counts[e] = 1);

    return source.toSet().toList().join(', ');
  }
}
