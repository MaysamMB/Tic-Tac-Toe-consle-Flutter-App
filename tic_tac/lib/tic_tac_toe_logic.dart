import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> board = List.generate(9, (index) => '');
  String currentPlayer = 'X';
  String message = '';

  void handleTap(int index) {
    if (message ==
            'This cell is already occupied. Please choose another one.' &&
        board[index] == '') {
      setState(() {
        message = '';
      });
    }

    if (message != '') {
      return;
    }

    if (board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        if (checkWinner(currentPlayer)) {
          message = 'Player $currentPlayer wins!';
        } else if (!board.contains('')) {
          message = 'It\'s a draw!';
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    } else {
      setState(() {
        message = 'This cell is already occupied. Please choose another one.';
      });
    }
  }

  bool checkWinner(String player) {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    return winConditions
        .any((condition) => condition.every((index) => board[index] == player));
  }

  void resetGame() {
    setState(() {
      board = List.generate(9, (index) => '');
      currentPlayer = 'X';
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontSize: 26,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 222, 218, 229),
        elevation: 8,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => handleTap(index),
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 195, 182, 218),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      board[index],
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: message.contains('occupied')
                  ? Colors.red
                  : const Color.fromARGB(255, 173, 152, 210),
            ),
          ),
          ElevatedButton(
            onPressed: resetGame,
            child: Text('Restart'),
          )
        ],
      ),
    );
  }
}
