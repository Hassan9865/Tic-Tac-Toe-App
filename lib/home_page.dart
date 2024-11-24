import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/color.dart';

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = '';
    });
  }

  void handleTap(int index) {
    if (board[index].isNotEmpty || winner.isNotEmpty) return;

    setState(() {
      board[index] = currentPlayer;
      if (checkWinner()) {
        winner = '$currentPlayer wins!';
      } else if (!board.contains('')) {
        winner = 'It\'s a draw!';
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  bool checkWinner() {
    const winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];
    for (var pattern in winPatterns) {
      if (board[pattern[0]] == currentPlayer &&
          board[pattern[1]] == currentPlayer &&
          board[pattern[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.color1,
      appBar: AppBar(
        backgroundColor: MyColor.color2,
        centerTitle: true,
        title: Text(
          "Tic Tac Toe Game",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 15),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "It's $currentPlayer turn".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 9),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => handleTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.color2,
                      ),
                      child: Center(
                        child: Text(
                          board[index],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              if (winner.isNotEmpty)
                Text(
                  winner,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: resetGame,
                child: Text('Reset Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
