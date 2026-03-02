import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/tic_tac_toe_logic.dart';

void main() {
  group('GameEngine - Winning Logic', () {
    
    test('should return X as winner when first row is all X', () {
      final board = ['X', 'X', 'X', '', '', '', '', '', ''];
      final winner = GameEngine.checkWinner(board);
      expect(winner, 'X');
    });

    

    test('should return null when the game is still ongoing', () {
      final board = ['X', '0', 'X', '', '', '', '', '', ''];
      final winner = GameEngine.checkWinner(board);
      expect(winner, null);
    });


    test('should return true when the game is drawn', () {
      final board = ['X', '0', 'X', 'X', '0', 'X', '0', 'X', '0'];
      final isDraw = GameEngine.isDraw(board);
      expect(isDraw, true);
    });
  });
}