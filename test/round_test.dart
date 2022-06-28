// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:number_base_ball/model/answer_model.dart';
import 'package:number_base_ball/model/round_model.dart';
import 'package:number_base_ball/model/user_input_model.dart';

void main() {
  Round round = Round(7, Answer(), UserInput([4, 3, 8]));

  group('라운드 : ', () {
    test('몇 번째 라운드인지 확인할 수 있어야 한다.', () {
      expect(round.getRound().runtimeType, int);
    });

    test('ball과 Strike의 수를 확인할 수 있어야 한다.', () {
      round.isStrikeAll();
    });
  });
}
