import 'dart:io';

class TicTacToe {
  List<String> board = List.generate(9, (index) => (index + 1).toString());
  String currentPlayer = 'X';

  void startGame() {
    print("Welcome to Tic-Tac-Toe!");
    displayBoard();

    while (true) {
      playerMove();
      displayBoard();

      if (checkWinner()) {
        print('Player ${currentPlayer} wins!');
        break;
      } else if (isDraw()) {
        print("It's a draw!");
        break;
      }

      switchPlayer();
    }

    print("Game over. Do you want to play again? (y/n)");
    String? answer = stdin.readLineSync();
    if (answer?.toLowerCase() == 'y') {
      resetGame();
      startGame();
    }
  }

  void displayBoard() {
    print("\n");
    for (int i = 0; i < 9; i += 3) {
      print(" ${board[i]} | ${board[i + 1]} | ${board[i + 2]}");
      if (i < 6) print("---+---+---");
    }
    print("\n");
  }

  void playerMove() {
    while (true) {
      print("Player ${currentPlayer}, enter your move (1-9): ");
      String? input = stdin.readLineSync();
      int? move = int.tryParse(input ?? '');

      if (move != null &&
          move >= 1 &&
          move <= 9 &&
          board[move - 1] != 'X' &&
          board[move - 1] != 'O') {
        board[move - 1] = currentPlayer;
        break;
      } else {
        print("Invalid move. Try again.");
      }
    }
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  bool checkWinner() {
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

    for (var condition in winConditions) {
      if (board[condition[0]] == currentPlayer &&
          board[condition[1]] == currentPlayer &&
          board[condition[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  bool isDraw() {
    return board.every((cell) => cell == 'X' || cell == 'O');
  }

  void resetGame() {
    board = List.generate(9, (index) => (index + 1).toString());
    currentPlayer = 'X';
  }
}

void main() {
  TicTacToe game = TicTacToe();
  game.startGame();
}
