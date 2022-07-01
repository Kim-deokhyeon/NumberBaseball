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

  bool checkEnd() {
    if (_times == 10) {
      return true;
    }

    return false;
  }

  Answer getAnswer() {
    return _answer;
  }

  UserInput getInput() {
    return _userInput;
  }

  Round copyWith({
    int? times,
    Answer? answer,
    UserInput? userInput,
  }) {
    return Round(times ?? _times, answer ?? _answer, userInput ?? _userInput);
  }
}
