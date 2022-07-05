// Result의 호출부에서 try catch를 걸자 - GDD

class Result {
  Result({required this.strike, required this.ball});

  final int strike;
  final int ball;

  bool checkWin() {
    if (strike == 3) {
      return true;
    }

    return false;
  }

  bool checkExceedValidValue() {
    if (strike + ball > 3) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    if (strike == 3) {
      return 'win!';
    }

    if (strike == 0 && ball == 0) {
      return 'nothing';
    }

    if (strike == 0 && ball != 0) {
      return 'ball : $ball';
    }

    if (strike != 0 && ball == 0) {
      return 'strike : $strike';
    }

    return 'strike : $strike\nball : $ball';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Result && strike == other.strike && ball == other.ball);
  }

  @override
  int get hashCode => strike.hashCode ^ ball.hashCode;
}
