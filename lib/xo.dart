import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Xo());
}

class Xo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                "X & O",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 40,
                ),
              )),
        ),
        body: MyGame(),
      ),
    );
  }
}

class MyGame extends StatefulWidget {
  @override
  _MyGameState createState() => _MyGameState();
}

var _matrix = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""]
];

class _MyGameState extends State<MyGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bulidElement(0, 0),
              bulidElement(0, 1),
              bulidElement(0, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bulidElement(1, 0),
              bulidElement(1, 1),
              bulidElement(1, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bulidElement(2, 0),
              bulidElement(2, 1),
              bulidElement(2, 2),
            ],
          )
        ],
      ),
    );
  }

  String _char = "X";

  Container bulidElement(int row, int col) {
    return Container(
      width: 150,
      height: 150,
      decoration:
      BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: FlatButton(
        onPressed: () {
          if (_matrix[row][col].isEmpty)
            setState(() {
              _matrix[row][col] = _char;
              _char = _char == "X" ? "O" : "X";
              CheckWinner(row, col);
            });
        },
        child: Text(
          "${_matrix[row][col]}",
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }

  CheckWinner(int x, int y) {
    var col = 0,
        row = 0,
        diag = 0,
        rdiag = 0;
    var n = _matrix.length - 1;
    var player = _matrix[x][y];
    for (int i = 0; i < _matrix.length; i++) {
      if (_matrix[x][i] == player)
        col++;
      if (_matrix[i][y] == player)
        row++;
      if (_matrix[i][i] == player)
        diag++;
      if (_matrix[i][n - i] == player)
        rdiag++;
    }
    if (row == n + 1 || col == n + 1 || diag == n + 1 || rdiag == n + 1) {
      showDialog(builder: (context) => AlertDialog(title: Text("Winner"), content:Text("$player Won"),), context: context);
      _matrix = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
      ];
    }
  }
}
