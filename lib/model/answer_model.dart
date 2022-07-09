class Answer {
  Answer({required List<int> initAnswer}) {
    _answerList = initAnswer;
  }

  List<int> _answerList = [];

  bool checkBall(int number, int index) {
    if (_answerList.contains(number) && _answerList.indexOf(number) != index) {
      return true;
    }

    return false;
  }

  bool checkStrike(int number, int index) {
    if (_answerList.contains(number) && _answerList.indexOf(number) == index) {
      return true;
    }

    return false;
  }

  List<int> getAnswer() {
    return _answerList;
  }

  bool isUnique() {
    if (_answerList.toSet().toList().length != 3) {
      return true;
    }

    return false;
  }

  @override
  String toString() {
    return _answerList.join(', ');
  }
}
