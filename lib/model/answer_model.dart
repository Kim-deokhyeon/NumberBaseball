import 'package:number_base_ball/constants.dart' as appConst;

class Answer {
  Answer() {
    _createAnswer();
  }

  List<int> _answerList = [];

  // resetAnswer() {
  //   _answerList.clear();
  //   createAnswer();
  // }

  _createAnswer() {
    List<int> copiedList = [...appConst.availableAnswers];
    copiedList.shuffle();
    _answerList = copiedList.sublist(0, 3);
  }

  List<int> getAnswer() {
    return _answerList;
  }

  bool isDuplicated() {
    if (_answerList.toSet().toList().length != 3) {
      return true;
    }

    return false;
  }
}
