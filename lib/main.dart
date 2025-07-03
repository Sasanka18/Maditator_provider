import 'package:flutter/material.dart';
import 'package:flutter_meditator/providers/filter_provider.dart';
import 'package:flutter_meditator/providers/meditation_provider.dart';
import 'package:flutter_meditator/providers/mindfull_exercise_provider.dart';
import 'package:flutter_meditator/providers/sleep_exerise_provider.dart';
import 'package:flutter_meditator/routers/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(context) => MindfullExerciseProvider(), ),
           ChangeNotifierProvider(
          create:(context) => MeditationProvider(), ),
           ChangeNotifierProvider(
          create:(context) => SleepExeriseProvider()),
           ChangeNotifierProvider(
          create:(context) => FilterProvider() ),
      ],
      child: MyApp()));

  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meditatate App Flutter',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routerConfig: RouterClass().router,
    );
  }
}