class GameEngine {
  static const List<List<int>> _winningCombinations = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],  // Columns
    [0, 3, 6], [1, 4, 7], [2, 5, 8],  // Rows
    [0, 4, 8], [2, 4, 6],             // Diagonals
  ];

  static String? checkWinner(List<String> board) {
    for (var combo in _winningCombinations) {
      final a = board[combo[0]];
      final b = board[combo[1]];
      final c = board[combo[2]];

      // All three positions the same and not empty -> we have a winner
      if (a.isNotEmpty && a == b && a == c) {
        return a;
      }
    }

    // no winner found yet
    return null;
  }

  static bool isDraw(List<String> board) {
  // No winner AND no field empty ('') -> then draw.
  return checkWinner(board) == null && board.every((cell) => cell.isNotEmpty);
  }
}