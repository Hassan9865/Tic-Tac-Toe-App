import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/color.dart';
import 'package:tic_tac_toe_app/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";

  List<int> scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  Game game = Game();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.color1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "It's $value turn".toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                  crossAxisCount: Game.boardLenght ~/ 3,
                  padding: EdgeInsets.all(16.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: List.generate(Game.boardLenght, (index) {
                    return InkWell(
                      onTap: gameOver
                          ? null
                          : () {
                              if (game.board![index] == "") {
                                setState(() {
                                  game.board![index] = value;
                                  turn++;
                                  gameOver = game.winnerCheck(
                                      value, index, scoreBoard, 3);
                                  if (gameOver) {
                                    result = "$value is the Winner";
                                  } else if (!gameOver && turn == 9) {
                                    result = "It's a Draw";
                                    gameOver = true;
                                  }
                                  if (value == "X")
                                    value = "0";
                                  else
                                    value = "X";
                                });
                              }
                            },
                      child: Container(
                        width: Game.boardSize,
                        height: Game.boardSize,
                        decoration: BoxDecoration(
                          color: MyColor.color2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            game.board![index],
                            style: TextStyle(
                              color: game.board![index] == "x"
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 64.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              result,
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    game.board = Game.initGameBoard();
                    value = "X";
                    gameOver = false;
                    turn = 0;
                    result = "";
                    scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];
                  });
                },
                icon: Icon(Icons.replay),
                label: Text("repeat the game"))
          ],
        ),
      ),
    );
  }
}
