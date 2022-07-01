import 'package:number_base_ball/controller/game_controller.dart';
import 'package:number_base_ball/view/game_view.dart';

void main() {
  GameController gameController = GameController(const GameView());
  gameController.initGame();
}
