# Tic-Tac-Toe-consle-Flutter-App
 A simple console-based Tic Tac Toe game built using Dart.

## How to Run the Project:

1. **Open your terminal (Command Prompt / PowerShell / etc.).**

2. **Navigate to the project directory:**
   ```bash
   cd "tic_tac_consl.dart"
   dart tic_tac_consol.dart
   
## Console Preview

Here is an example of the console output when an invalid step is made:

![Console Output](https://raw.githubusercontent.com/MaysamMB/Tic-Tac-Toe-consle-Flutter-App/main/output_image/invalid_step.png)



# Tic Tac Toe Flutter App
Requirements:
  1.Flutter SDK.
  2.Dart SDK.

Android Studio or VS Code (recommended for running emulators)

A simple Tic Tac Toe game built using Flutter.

## How to Run the Project
Follow these steps to run the Flutter app:

1. **Make sure Flutter is installed on your machine.**  
   You can verify this by running:
   ```bash
   flutter --version
   cd "tic_tac/lib"
   flutter pub get
   flutter run lib/tic_tac_toe_logic.dart

## Game Results

### Draw Example

When the game ends in a draw, the console shows:

![Draw Result](https://raw.githubusercontent.com/MaysamMB/Tic-Tac-Toe-consle-Flutter-App/main/output_image/Draw.png)



### Win Example

When a player wins, the console displays:

![Win Result](https://raw.githubusercontent.com/MaysamMB/Tic-Tac-Toe-consle-Flutter-App/main/output_image/Wins.png)


## VS Code Launch Configuration

Make sure your `.vscode/launch.json` file looks like this to properly run the Flutter app:

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "tic_tac",
            "cwd": "tic_tac",
            "request": "launch",
            "type": "dart",
            "program": "lib/tic_tac_toe_logic.dart"
        },
        {
            "name": "tic_tac (profile mode)",
            "cwd": "tic_tac",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "program": "lib/tic_tac_toe_logic.dart"
        },
        {
            "name": "tic_tac (release mode)",
            "cwd": "tic_tac",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "program": "lib/tic_tac_toe_logic.dart"
        }
    ]
}



