import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("X or O"),
        ),
        body: Game(),
      ),
    );
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<List<String>> _matrix = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElement(0, 0),
                buildElement(0, 1),
                buildElement(0, 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElement(1, 0),
                buildElement(1, 1),
                buildElement(1, 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElement(2, 0),
                buildElement(2, 1),
                buildElement(2, 2),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _lastchar = 'x';
  CheckWinner(int x,int y){
    var col=0,row=0,diag=0,rdiag=0;
    var n=_matrix.length-1;
    var player= _matrix[x][y];
    for(int i=0;i<_matrix.length;i++)
      {
        if(_matrix[x][i]==player)
          col++;
        if(_matrix[i][y]==player)
          row++;
        if(_matrix[i][i]==player)
          diag++;
        if(_matrix[i][n-i]==player)
          rdiag++;
      }
    if(row==n+1||col==n+1||diag==n+1||rdiag==n+1) {
      showDialog(builder: (context) => AlertDialog(title: Text("Winner"),
      content: Text("$player Won"),), context: context);
      _matrix = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
    }
  }
  Container buildElement(int row, int col) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black, width: 2)),
      child: FlatButton(

        onPressed: () {
          if(_matrix[row][col].isEmpty){
          setState(() {
            _matrix[row][col] = _lastchar;
            if (_lastchar == 'o')
              _lastchar = 'x';
            else
              _lastchar = 'o';

            CheckWinner(row, col);
          });}

        },
        child: Text(
          "${_matrix[row][col]}",
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
