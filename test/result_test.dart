// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:number_base_ball/model/result_model.dart';

void main() {
  Result result = Result(0, 0);

  group('결과값 : ', () {
    test('strike와 ball이 둘 다 0이면 nothing을 보인다', () {
      expect(result.toString(), 'nothing');
    }, skip: result.strike != 0 || result.ball != 0);

    test('strike와 ball이 둘 다 0이 아니면 각 count를 보인다', () {
      result = Result(1, 1);

      expect(result.toString(),
          'strike : ${result.strike}\nball : ${result.ball}');
    });

    test('strike와 ball의 합이 결과값의 크기를 넘으면 throw', () {
      result = Result(10, 8);

      expect(result.toString(), 'error');
    });
  });
}
