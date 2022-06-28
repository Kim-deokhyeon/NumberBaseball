// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:number_base_ball/model/answer_model.dart';

void main() {
  Answer answer = Answer();
  group('정답은 ', () {
    test('길이가 3이여야 한다.', () {
      expect(answer.getAnswer().length, 3);
    });

    test('중복이 없어야 한다.', () {
      // 메서드 명이 중복이 되었는지 묻고 있는데
      // 원하는 결과는 아니다 라서 false로 검증하는데
      // 이게 맞는건지?
      expect(answer.isDuplicated(), false);
    });

    // 정답이 본인을 리셋하는게 아니라
    // 컨트롤러가 새로운 Answer를 생성하는게 맞는 것 같다.
    // test('reset이 가능해야 한다.', () {
    //   Answer newAnswer = answer;
    // });
  });
}
