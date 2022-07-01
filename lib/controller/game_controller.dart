import 'dart:developer';
import 'dart:io';

import 'package:number_base_ball/constants.dart' as app_const;
import 'package:number_base_ball/model/answer_model.dart';
import 'package:number_base_ball/model/refree_model.dart';
import 'package:number_base_ball/model/result_model.dart';
import 'package:number_base_ball/model/round_model.dart';
import 'package:number_base_ball/model/user_input_model.dart';
import 'package:number_base_ball/view/game_view.dart';

class GameController {
  GameController(this.view);
  static const maxInning = app_const.maxInning;
  int tempRound = 0;

  final GameView view;
  late Answer answer;
  Referee referee = Referee();

  Answer createAnswer() {
    List<int> shuffledList = [...app_const.availableAnswers];
    shuffledList.shuffle();

    List<int> createdAnswer = shuffledList.sublist(0, 3);

    return Answer(initAnswer: createdAnswer);
  }

  UserInput? readUserInput() {
    view.showInputAnnounceMessage();
    try {
      List<int> oneLine3Input = (stdin.readLineSync() ?? '')
          .split(' ')
          .map((e) => int.parse(e))
          .toList();

      return UserInput(oneLine3Input);
    } on Error catch (error) {
      maybeErrorWithGame(error);
      return null; // deadCode의 느낌,, error 처리 메서드에 강제 종료 들어가있음
    }
  }

  // checkMoreGame() {
  //   view.
  // }

  initGame() {
    view.showGameInit();
    answer = createAnswer();

    playGame();
  }

  maybeErrorWithGame(Error? error) {
    log(error?.toString() ?? '');
    view.showInputErrorMessage();
    exit(0);
  }

  endGameWithUserWin() {
    view.showWinnerMessage();
  }

  endGameWithUserLose() {
    view.showLoserMessage(answer.toString());
  }

  checkMoreGame() {
    view.showAskMoreGameMeesage();
    bool noMoreGame = (stdin.readLineSync() ?? 'Y') == 'Y';
    if (noMoreGame) {
      view.showGameOver();
      exit(0);
    }

    answer = createAnswer();

    playGame();
  }

  playGame() {
    for (int i = 0; i <= maxInning; i++) {
      if (i == maxInning) {
        // 9회가 초과 된 시점
        // 굳이 9를 안넘겨도 될 것 같긴한데
        // 이기건 지건, 이후의 문장을 공통으로 쓰고 싶음
        endGameWithUserLose();
        break;
      }

      // null이 return 되기 전에 강제 종료라 ! 처리 하였는데,,
      // 더 우아하게 try, catch를 할 순 없을까
      UserInput userInput = readUserInput()!;
      Round round = Round(i + 1, answer, userInput);
      Result result = referee.judge(round);
      view.showRoundResult(result.toString());
      if (result.checkWin()) {
        endGameWithUserWin();
        break;
      }
    }

    checkMoreGame();
  }
}
