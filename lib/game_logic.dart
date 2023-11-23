class Player {
  static const x = "X";
  static const o = "O";
  static const Emty = "";
}

class Game {
  static final boardLenght = 9;
  static final boardSize = 100.0;

  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardLenght, (index) => Player.Emty);

  bool winnerCheck(
      String player, int index, List<int> scoreBoard, int gridsize) {
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreBoard[row] += score;
    scoreBoard[gridsize + col] += score;
    if (row == col) scoreBoard[2 * gridsize] += score;
    if (gridsize - 1 - col == row) scoreBoard[2 * gridsize + 1] += score;

    if (scoreBoard.contains(3) || scoreBoard.contains(-3)) {
      return true;
    }
    return false;
  }
}
