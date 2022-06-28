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
      throw StateError('입력된 값이 3이 아닙니다.');
    }
  }

  _validateDuplicate(List<int> inputNumbers) {
    List<int> inputNumbersWithDeduplication = inputNumbers.toSet().toList();
    if (inputNumbersWithDeduplication.length != 3) {
      throw StateError('중복 된 값이 있습니다..');
    }
  }
}
