import 'dart:io';
import 'db.dart';
import 'user_class.dart';
import 'display_class.dart';

void adminMenu() {
  while (true) {
    try {
      print("""
==============================
🛠️ Admin Dashboard
==============================
1. ➕ Add Client
2. ➕ Add Trainer
3. 🧾 View All Clients
4. 🧾 View All Trainers
5. ❌ Remove Trainer
6. ❌ Remove Client
7. 🔙 Back to main menu
==============================
""");
      stdout.write("Choose: ");
      int input = int.parse(stdin.readLineSync()!);

      switch (input) {
        case 1:
          while (true) {
            try {
              stdout.write("Client Name: ");
              String cname = stdin.readLineSync()!;
              stdout.write("Client Password: ");
              String cpass = stdin.readLineSync()!;
              clients[userIdCounter] = Client(
                name: cname,
                password: cpass,
                id: userIdCounter,
              );
              print("✅ Client added with ID: $userIdCounter");
              userIdCounter++;
              break;
            } catch (e) {
              print("❌ Failed to add client. Please try again.");
            }
          }
          break;

        case 2:
          while (true) {
            try {
              stdout.write("Trainer Name: ");
              String tname = stdin.readLineSync()!;
              stdout.write("Trainer Password: ");
              String tpass = stdin.readLineSync()!;
              trainers[trainerIdCounter] = Trainer(
                name: tname,
                password: tpass,
                id: trainerIdCounter,
              );
              print("✅ Trainer added with ID: $trainerIdCounter");
              trainerIdCounter++;
              break;
            } catch (e) {
              print("❌ Failed to add trainer. Please try again.");
            }
          }
          break;

        case 3:
          while (true) {
            try {
              print("Clients List:");
              clients.forEach((id, client) {
                print("🆔 $id | 👤 ${client.name}");
              });
              stdout.write("Press Enter to go back...");
              stdin.readLineSync();
              break;
            } catch (e) {
              print("❌ Unable to display clients.");
            }
          }
          break;

        case 4:
          while (true) {
            try {
              print("Trainers List:");
              trainers.forEach((id, trainer) {
                print("🆔 $id | 🏋️‍♂️ ${trainer.name}");
              });
              stdout.write("Press Enter to go back...");
              stdin.readLineSync();
              break;
            } catch (e) {
              print("❌ Unable to display trainers.");
            }
          }
          break;

        case 5:
          while (true) {
            try {
              stdout.write("Enter Trainer ID to remove: ");
              int tid = int.parse(stdin.readLineSync()!);
              if (trainers.containsKey(tid)) {
                print("✅ Removed Trainer: ${trainers[tid]!.name}");
                trainers.remove(tid);
              } else {
                print("❌ Trainer ID not found.");
              }
              break;
            } catch (e) {
              print("❌ Invalid input. Please try again.");
            }
          }
          break;

        case 6:
          while (true) {
            try {
              stdout.write("Enter Client ID to remove: ");
              int cid = int.parse(stdin.readLineSync()!);
              if (clients.containsKey(cid)) {
                print("✅ Removed Client: ${clients[cid]!.name}");
                clients.remove(cid);
              } else {
                print("❌ Client ID not found.");
              }
              break;
            } catch (e) {
              print("❌ Invalid input. Please try again.");
            }
          }
          break;

        case 7:
          Menu.display();
          break;

        default:
          print("❌ Invalid option.");
      }
    } catch (e) {
      print("❌ An error occurred. Please try again.");
    }
  }
}
