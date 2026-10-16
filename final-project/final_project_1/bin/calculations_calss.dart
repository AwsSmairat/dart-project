import 'dart:io';
import 'display_class.dart';

class Calculations {
  static void calculateCalories() {
    while (true) {
      try {
        print("""
======================
1. 🔙 Back to main menu
2. stay this page
======================
        """);
        int back = int.parse(stdin.readLineSync()!);
        if (back == 1) {
          print("🔙 Returning to main menu.");
          Menu.display();
          break;
        }

        stdout.write("Enter your gender (M/F): ");
        String gender = stdin.readLineSync()!;

        if (gender.toUpperCase() != 'M' && gender.toUpperCase() != 'F') {
          print("❌ Invalid gender input. Please enter 'M' or 'F'.");
        }

        stdout.write("Enter your weight (kg): ");
        int weight = int.parse(stdin.readLineSync()!);

        stdout.write("Enter your height (cm): ");
        int height = int.parse(stdin.readLineSync()!);

        stdout.write("Enter your age (years): ");
        int age = int.parse(stdin.readLineSync()!);

        if (weight <= 0 || height <= 0 || age <= 0) {
          print("❌ Invalid input for weight, height, or age.");
          continue;
        }

        print("""
Enter activity level (1-5):
1. 🚶🏻‍➡️ Sedentary
2. 🚶🏻‍➡️ Lightly active
3. 🏃🏻‍➡️ Moderately active
4. 🏃🏻‍➡️ Very active
5. 🏃🏻‍➡️ Extra active
""");
        stdout.write("Your choice: ");
        int activityLevel = int.parse(stdin.readLineSync()!);

        double bmr;
        if (gender.toUpperCase() == 'M') {
          bmr = 10 * weight + 6.25 * height - 5 * age + 5;
        } else {
          bmr = 10 * weight + 6.25 * height - 5 * age - 161;
        }

        double activityFactor;
        switch (activityLevel) {
          case 1:
            activityFactor = 1.2;
            break;
          case 2:
            activityFactor = 1.375;
            break;
          case 3:
            activityFactor = 1.55;
            break;
          case 4:
            activityFactor = 1.725;
            break;
          case 5:
            activityFactor = 1.9;
            break;
          default:
            print(
              "❌ Invalid activity level. Please enter a number between 1-6",
            );
            continue;
        }

        double totalCalories = bmr * activityFactor;

        print("✅ Your estimated daily calorie needs: $totalCalories kcal");
      } catch (e) {
        print("❌ Invalid input. Try again.");
      }
    }
  }

  static void calculateProtein() {
    while (true) {
      try {
        print("""
======================
1. 🔙 Back to main menu
2. Stay on this page
======================
        """);
        int back = int.parse(stdin.readLineSync()!);
        if (back == 1) {
          print("🔙 Returning to main menu.");
          Menu.display();
          break;
        }

        stdout.write("⚖️ Enter your weight (kg): ");
        double weight = double.parse(stdin.readLineSync()!);
        if (weight <= 0) {
          print("❌ Weight must be greater than 0.");
          continue;
        }

        stdout.write("🏃‍♂️ Are you an athlete? (Y = Yes, N = No): ");
        String choose = stdin.readLineSync()!;

        double protein;
        if (choose.toUpperCase == "Y") {
          protein = weight * 2.0;
        } else if (choose.toUpperCase == "N") {
          protein = weight * 0.8;
        } else {
          print("❌ Invalid input. Please enter Y or N.");
          continue;
        }

        print("💪 Your recommended protein intake: $protein grams");
      } catch (e) {
        print("❌ Invalid input. Try again.");
      }
    }
  }

  static void calculateCarb() {
    while (true) {
      try {
        print("""
======================
1. 🔙 Back to main menu
2. Stay on this page
======================
      """);
        int back = int.parse(stdin.readLineSync()!);
        if (back == 1) {
          print("🔙 Returning to main menu.");
          Menu.display();
          break;
        }

        stdout.write("⚖️ Enter your weight (kg): ");
        double weight = double.parse(stdin.readLineSync()!);
        if (weight <= 0) {
          print("❌ Weight must be greater than 0.");
          continue;
        }

        stdout.write("🏃‍♂️ Are you an athlete? (Y = Yes, N = No): ");
        String choose = stdin.readLineSync()!;

        double carbs;
        if (choose.toUpperCase == "Y") {
          carbs = weight * 6.0;
        } else if (choose.toUpperCase == "N") {
          carbs = weight * 3.0;
        } else {
          print("❌ Invalid input. Please enter 'Y' or 'N'.");
          continue;
        }

        print("🍞 Your recommended daily carbohydrate intake: $carbs grams");
      } catch (e) {
        print("❌ Invalid input. Try again.");
      }
    }
  }
}
