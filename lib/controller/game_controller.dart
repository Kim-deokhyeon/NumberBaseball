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
  GameController(this.gameConsole);
  final GameView gameConsole;
  late Answer answer;

  void createAnswer() {
    List<int> shuffledList = [...app_const.availableAnswers];
    shuffledList.shuffle();

    List<int> createdAnswer = shuffledList.sublist(0, 3);

    answer = Answer(initAnswer: createdAnswer);
  }

  UserInput? readUserInput() {
    gameConsole.showInputAnnounceMessage();
    try {
      List<int> oneLine3Input = (stdin.readLineSync() ?? '')
          .split(' ')
          .map((e) => int.parse(e))
          .toList();

      return UserInput(oneLine3Input);
    } on Error catch (error) {
      maybeErrorWithGame(error);
      return null; // deadCode의 느낌,, error 처리 메서드에 강제 종료 들어가있음
    } on UserInputException catch (inputException) {
      maybeExceptionWithInput(inputException);
      return null; // deadCode의 느낌,, error 처리 메서드에 강제 종료 들어가있음
    }
  }

  // checkMoreGame() {
  //   view.
  // }

  initGame() {
    gameConsole.showGameInit();
    runGame();
  }

  runGame() {
    createAnswer();
    playGame();
  }

  maybeExceptionWithInput(UserInputException exception) {
    gameConsole.showInputExceptionMessage(exception);
    exit(0);
  }

  maybeErrorWithGame(Error? error) {
    log(error?.toString() ?? '');
    // TODO : 다른 error나 exception 상황이 있을지 생각해보기
    // view.showInputErrorMessage();
    exit(0);
  }

  checkMoreGame() {
    gameConsole.showAskMoreGameMeesage();
    bool noMoreGame = (stdin.readLineSync() ?? 'Y') == 'Y';
    if (noMoreGame) {
      gameConsole.showGameOver();
      exit(0);
    }

    runGame();
  }

  playGame() {
    for (int i = 0; i <= app_const.maxInning; i++) {
      if (i == app_const.maxInning) {
        // 9회가 초과 된 시점
        // 굳이 9를 안넘겨도 될 것 같긴한데
        // 이기건 지건, 이후의 문장을 공통으로 쓰고 싶음
        gameConsole.showLoserMessage(answer.toString());
        break;
      }

      // null이 return 되기 전에 강제 종료라 ! 처리 하였는데,,
      // 더 우아하게 try, catch를 할 순 없을까
      UserInput userInput = readUserInput()!;
      Round round = Round(i + 1, answer, userInput);
      Referee referee = Referee(round);
      Result result = referee.judge();
      gameConsole.showRoundResult(result.toString());
      if (result.checkWin()) {
        gameConsole.showWinnerMessage();

        break;
      }
    }

    checkMoreGame();
  }
}
