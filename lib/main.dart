import 'package:flutter/material.dart';
import 'package:flutter_meditator/routers/router.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());

  
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