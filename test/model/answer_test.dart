// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:number_base_ball/model/answer_model.dart';

void main() {
  answerTest();
}

void answerTest({Answer? answerCreateByGameController}) {
  Answer answer = answerCreateByGameController ?? Answer(initAnswer: [3, 6, 5]);
  group('정답은', () {
    test('길이가 3이여야 한다.', () {
      expect(answer.getAnswer().length, 3);
    });

    test('중복이 없어야 한다.', () {
      // 메서드 명이 중복이 되었는지 묻고 있는데
      // 원하는 결과는 아니다 라서 false로 검증하는데
      // 이게 맞는건지?
      expect(answer.isDuplicated(), false);

      answer = Answer(initAnswer: [3, 3, 3]);

      expect(answer.isDuplicated(), true);
    });
  });

  group('특정 숫자의 상태를 판단 할 수 있어야 한다.', () {
    test('정답이 4,5,3 일 경우 볼 검증', () {
      answer = Answer(initAnswer: [4, 5, 3]);
      expect(answer.isBall(4, 0).runtimeType, bool);
      expect(answer.isBall(4, 0), false);
      expect(answer.isBall(4, 1), true);
      expect(answer.isBall(8, 0), false);
    });

    test('정답이 4,5,3 일 경우 스트라이크 검증', () {
      answer = Answer(initAnswer: [4, 5, 3]);
      expect(answer.isStrike(4, 0).runtimeType, bool);
      expect(answer.isStrike(4, 0), true);
      expect(answer.isStrike(4, 1), false);
    });
  });
}
