import 'dart:io';
import 'db.dart';
import 'workout_class.dart';
import 'display_class.dart';

void trainerMenu(int trainerId) {
  while (true) {
    try {
      print(""""
==============================
🏋️‍♂️ Trainer Dashboard
==============================
1. ➕ Add Workout to Client
2. 🔙 Back to main menu
==============================
""");
      stdout.write("Choose: ");
      int input = int.parse(stdin.readLineSync()!);
      if (input == 1) {
        stdout.write("Enter Client ID to assign workout: ");
        int cid = int.parse(stdin.readLineSync()!);

        if (clients.containsKey(cid)) {
          stdout.write("Workout Name: ");
          String wname = stdin.readLineSync()!;
          stdout.write("Workout Description: ");
          String desc = stdin.readLineSync()!;

          clientWorkouts.putIfAbsent(cid, () => []);
          clientWorkouts[cid]!.add(Workout(name: wname, description: desc));
          print("✅ Workout added to ${clients[cid]!.name}");
        } else {
          print("❌ Client not found.");
        }
      } else if (input == 2) {
        Menu.display();
      } else {
        print("❌ Invalid choice.");
      }
    } catch (e) {
      print("❌ Invalid input. Try again.");
    }
  }
}

void trainerLogin() {
  while (true) {
    try {
      stdout.write("Enter Trainer ID: ");
      int id = int.parse(stdin.readLineSync()!);

      if (trainers.containsKey(id)) {
        stdout.write("Enter your name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter your password: ");
        String password = stdin.readLineSync()!;

        if (trainers[id]!.name == name && trainers[id]!.password == password) {
          print("✅ Welcome Coach ${trainers[id]!.name}");
          trainerMenu(id);
        } else {
          print("❌ Incorrect name or password.");
        }
      } else {
        print("❌ Trainer not found.");
      }
    } catch (e) {
      print("❌ Invalid input. Try again.");
    }
  }
}
