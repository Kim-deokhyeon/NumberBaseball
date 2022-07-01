import 'dart:io';

class GameView {
  const GameView();

  void showGameInit() {
    stdout.writeln('TDD로 만들어보는 우당탕탕 숫자 야구');
  }

  void showInputAnnounceMessage() {
    stdout.writeln('정답을 입력해주세요!');
  }

  void showWinnerMessage() {
    stdout.writeln('정답을 맞추었어요!');
  }

  void showLoserMessage(String answerList) {
    stdout.writeln('다음엔 맞춰보세요');
    stdout.writeln('정답은 $answerList 입니다');
  }

  void showGameOver() {
    stdout.writeln('게임이 종료되었습니다!');
  }

  void showReloading() {
    stdout.writeln('게임이 다시 설정중이에요!');
  }

  void showReloaded() {
    stdout.writeln('게임이 다시 설정됬어요!');
  }

  void showAskMoreGameMeesage() {
    stdout.writeln('종료를 원하시면 \'Y\'을 입력해주세요!');
  }

  void showInputErrorMessage() {
    stdout.writeln('입력이 잘못된 것 같아요!');
    stdout.writeln('게임을 종료합니다..');
  }

  void showRoundResult(String result) {
    stdout.writeln(result);
  }
}
