// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:number_base_ball/controller/game_controller.dart';
import 'package:number_base_ball/model/answer_model.dart';
import 'package:number_base_ball/view/game_view.dart';

import '../model/answer_test.dart';

void main() {
  GameController gameController = GameController(const GameView());

  gameController.createAnswer();
  Answer answer = gameController.answer;

  answerTest(answerCreateByGameController: answer);
}
