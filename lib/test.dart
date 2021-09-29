import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("X & O"),),
        body: Screen(),
      ),
    );
  }
}

class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

var matrix=[
  ['','',''],
  ['','',''],
  ['','',''],
];

class _ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(shape: BoxShape.rectangle),
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
          ),

        ]


        ,
      ),
    );
  }
String _lastchar='X';
  int col=0;
  int row=0;
  Container buildElement(int row,int col) {
    return Container(
      height: 150,
              width: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
              child:FlatButton(onPressed: () {
                if(matrix[row][col].isEmpty)
                setState(() {

                    matrix[row][col]=_lastchar;
                    _lastchar=_lastchar=='X'?'O':'X';
                  CheckWinner(row, col);
                  });
              }, child: Text("${matrix[row][col]}",style: TextStyle(fontSize: 60),)),
            );
  }

  CheckWinner(int x,int y){
    var col=0,row=0,diag=0,rdiag=0;
    var n=matrix.length-1;
    var player= matrix[x][y];
    for(int i=0;i<matrix.length;i++)
    {
      if(matrix[x][i]==player)
        col++;
      if(matrix[i][y]==player)
        row++;
      if(matrix[i][i]==player)
        diag++;
      if(matrix[i][n-i]==player)
        rdiag++;
    }
    if(row==n+1||col==n+1||diag==n+1||rdiag==n+1) {
      showDialog(builder: (context) => AlertDialog(title: Text("Winner"),
        content: Text("$player Won"),), context:context);
      matrix = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
    }
  }

}