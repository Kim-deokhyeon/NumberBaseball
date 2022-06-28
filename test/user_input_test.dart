// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:number_base_ball/model/user_input_model.dart';

void main() {
  late final UserInput userInput;

  test('사용자 입력은 길이가 3인 정수를 중복없이 입력받아야 한다.', () {
    List<int> oneLine3Input = '1 2 3' //(stdin.readLineSync() ?? '')
        .split(' ')
        .map((e) => int.parse(e))
        .toList();

    userInput = UserInput(oneLine3Input);
  });
}
