import 'user_class.dart';
import 'workout_class.dart';
import 'dart:io';
import 'calculations_calss.dart';
import 'client.dart';

int userIdCounter = 1;
int trainerIdCounter = 1;

Map<int, Client> clients = {};
Map<int, Trainer> trainers = {};
Map<int, List<Workout>> clientWorkouts = {};
