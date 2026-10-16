import 'dart:io';
import 'calculations_calss.dart';
import 'db.dart';
import 'workout_class.dart';
import 'display_class.dart';
import 'user_class.dart';

void clientMenu(int id) {
  while (true) {
    try {
      print("""
==============================
👤 Client Dashboard
==============================
1. 📋 View Workouts
2. 🔥 Calculate Calories
3. 💪 Calculate Protein
4. 🍞 Calculate Carbohydrates
5. 🔙 Back to main menu
==============================
""");
      stdout.write("Choose: ");
      int input = int.parse(stdin.readLineSync()!);
      switch (input) {
        case 1:
          var workouts = clientWorkouts[id] ?? [];
          if (workouts.isEmpty) {
            print("🚫 No workouts assigned.");
          } else {
            for (var w in workouts) {
              print("🏋️‍♀️ ${w.name} - ${w.description}");
            }
          }
          break;
        case 2:
          Calculations.calculateCalories();
          break;
        case 3:
          Calculations.calculateProtein();
          break;
        case 4:
          Calculations.calculateCarb();
          break;
        case 5:
          Menu.display();
          break;
        default:
          print("❌ Invalid choice.");
      }
    } catch (e) {
      print("❌ Invalid input. Try again.");
    }
  }
}

void signUpClient() {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter your password: ");
  String password = stdin.readLineSync()!;

  clients[userIdCounter] = Client(
    name: name,
    password: password,
    id: userIdCounter,
  );

  print("✅ Client account created successfully. Your ID is: $userIdCounter");
  userIdCounter++;
}

void clientLogin() {
  while (true) {
    try {
      stdout.write("Enter Client ID: ");
      int id = int.parse(stdin.readLineSync()!);

      if (clients.containsKey(id)) {
        stdout.write("Enter your name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter your password: ");
        String password = stdin.readLineSync()!;

        if (clients[id]!.name == name && clients[id]!.password == password) {
          print("✅ Welcome ${clients[id]!.name}");
          clientMenu(id);
        } else {
          print("❌ Incorrect name or password.");
        }
      } else {
        print("❌ Client not found.");
      }
    } catch (e) {
      print("❌ Invalid input. Try again.");
    }
  }
}
