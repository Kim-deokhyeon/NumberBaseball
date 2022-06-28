class Result {
  Result(this.strike, this.ball);

  final int strike;
  final int ball;

  @override
  String toString() {
    try {
      if (strike + ball > 3) {
        throw Exception();
      }
    } catch (error) {
      return 'error';
    }

    if (strike == 0 && ball == 0) {
      return 'nothing';
    }

    return 'strike : $strike\nball : $ball';
  }
}
