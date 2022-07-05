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
  Round round = Round(7, Answer(initAnswer: [3, 2, 5]), UserInput([4, 3, 8]));

  group('라운드 : ', () {
    test('몇 번째 라운드인지 확인할 수 있어야 한다.', () {
      expect(round.getNow().runtimeType, int);
    });

    test('9라운드가 초과 될 시 종료 되었음을 확인 할 수 있어야 한다.', () {
      expect(round.checkEnd().runtimeType, bool);
      expect(round.checkEnd(), false);

      round = round.copyWith(times: 10);
      expect(round.checkEnd(), true);
    });
  });
}
