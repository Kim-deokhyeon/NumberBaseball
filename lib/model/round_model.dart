import 'package:number_base_ball/model/answer_model.dart';
import 'package:number_base_ball/model/user_input_model.dart';

class Round {
  Round(this._times, this._answer, this._userInput);

  final int _times;
  final Answer _answer;
  final UserInput _userInput;

  int getRound() {
    return _times;
  }

  int getStrikeCount() {
    int strikeCount = 0;
    for (int i = 0; i < _answer.getAnswer().length; i++) {
      // _answer
    }
    return strikeCount;
  }

  int getBallCount() {
    int ballCount = 0;
    return ballCount;
  }

  bool isStrikeAll() {
    if (getStrikeCount() == 3) {
      return true;
    }

    return false;
  }

  @override
  String toString() {
    return 'ballCount : ';
  }
}
