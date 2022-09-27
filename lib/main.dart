import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_project/firebase_options.dart';
import 'package:learning_project/src/app.dart';
import 'package:learning_project/src/config/themes/theme_controller.dart';
import 'package:learning_project/src/services/auth_service/auth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/services/ghibli_service/ghibli_service.dart';
void main() async{
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  var services = GetIt.I;

  services.registerSingleton<AuthService>(AuthService(false));
  services.registerSingleton<GhibliService>(GhibliService.create());
  services.registerSingleton<ThemeController>(ThemeController());
  runApp(MyApp());
}