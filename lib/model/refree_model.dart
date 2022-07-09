import 'package:number_base_ball/model/answer_model.dart';
import 'package:number_base_ball/model/result_model.dart';
import 'package:number_base_ball/model/round_model.dart';
import 'package:number_base_ball/model/user_input_model.dart';

class Referee {
  Referee(this.responsibleRound);
  final Round responsibleRound;

  Result judge() {
    Answer answer = responsibleRound.getAnswer();
    UserInput userInput = responsibleRound.getInput();

    int strikeCount = _getStrikeCount(answer, userInput);
    int ballCount = _getBallCount(answer, userInput);

    return Result(strike: strikeCount, ball: ballCount);
  }

  int _getBallCount(Answer answer, UserInput userInput) {
    int ballCount = 0;
    List<int> userInputList = userInput.getInput();

    for (int i = 0; i < userInputList.length; i++) {
      if (answer.checkBall(userInputList[i], i)) {
        ballCount++;
      }
    }
    return ballCount;
  }

  int _getStrikeCount(Answer answer, UserInput userInput) {
    int strikeCount = 0;
    List<int> userInputList = userInput.getInput();

    for (int i = 0; i < userInputList.length; i++) {
      if (answer.checkStrike(userInputList[i], i)) {
        strikeCount++;
      }
    }
    return strikeCount;
  }

  Referee copyWith({
    Round? responsibleRound,
  }) {
    return Referee(responsibleRound ?? this.responsibleRound);
  }
}
