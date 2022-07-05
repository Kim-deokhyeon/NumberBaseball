import 'package:flutter_test/flutter_test.dart';
import 'package:number_base_ball/model/answer_model.dart';
import 'package:number_base_ball/model/refree_model.dart';
import 'package:number_base_ball/model/result_model.dart';
import 'package:number_base_ball/model/round_model.dart';
import 'package:number_base_ball/model/user_input_model.dart';

void main() {
  Referee referee;
  Round round = Round(7, Answer(initAnswer: [3, 2, 5]), UserInput([3, 6, 7]));

  group('심판 테스트 : ', () {
    referee = Referee(round);
    test('각 입력에 대해 판단을 내릴 수 있어야 한다.', () {
      expect(referee.judge().runtimeType, Result);

      referee = Referee(round.copyWith(answer: Answer(initAnswer: [6, 4, 2])));
      expect(referee.judge(), Result(strike: 0, ball: 1));

      referee = Referee(round.copyWith(answer: Answer(initAnswer: [7, 6, 3])));
      expect(referee.judge() == Result(strike: 1, ball: 2), true);

      referee = Referee(
          round = round.copyWith(answer: Answer(initAnswer: [3, 5, 4])));
      expect(referee.judge() == Result(strike: 1, ball: 0), true);

      referee = Referee(
          round = round.copyWith(answer: Answer(initAnswer: [3, 6, 7])));
      expect(referee.judge() == Result(strike: 3, ball: 0), true);
    });

    // 컴퓨터의 정답이나 사용자의 입력이 틀린 경우를 여기서 처리하는게 맞을까?
    // 아닌 것 같음,, 일단 적어보는 중,,
    // test("check argument error", () {
    //   UserInput userInput = UserInput([3, 6, 7]);

    //   expect(referee.judge(Answer(initAnswer: [7, 7, 4]), userInput),
    //       throwsA(TypeMatcher<ArgumentError>()));
    //   userInput = UserInput([3, 3, 7]);

    //   expect(referee.judge(Answer(initAnswer: [7, 6, 4]), userInput),
    //       throwsA(TypeMatcher<ArgumentError>()));
    // });
  });
}
