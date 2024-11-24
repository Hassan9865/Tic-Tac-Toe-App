import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/color.dart';

class ApnaGame extends StatefulWidget {
  const ApnaGame({super.key});

  @override
  State<ApnaGame> createState() => _ApnaGameState();
}

class _ApnaGameState extends State<ApnaGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.color1,
      appBar: AppBar(
        title: Text("Tic Tac Toe Game"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
              itemBuilder: (context, index) {
                return Container();
              })
        ],
      )),
    );
  }
}
