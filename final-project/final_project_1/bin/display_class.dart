import 'dart:io';
import 'db.dart';
import 'client.dart';
import 'trainer.dart';
import 'admin.dart';
import 'user_class.dart';

class Menu {
  static void display() {
    while (true) {
      try {
        print("""
==============================
🏋️ GYM MANAGEMENT SYSTEM
==============================
1. 👤 Client Login
2. 🏋️‍♂️ Trainer Login
3. 🛠️ Admin Login
4. 🚪 Exit
==============================
""");
        stdout.write("Choose an option: ");
        int choice = int.parse(stdin.readLineSync()!);

        switch (choice) {
          case 1:
            clientLogin();
            break;
          case 2:
            trainerLogin();
            break;
          case 3:
            adminMenu();
            break;
          case 4:
            print("👋 Exiting Goodbye");
            exit(0);
          default:
            print("❌ Invalid option. Please choose between 1-4.");
        }
      } catch (e) {
        print("❌ An error occurred. Please try again. ");
      }
    }
  }
}
