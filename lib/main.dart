// import 'package:Flutter_Wallpaper/screens/splashScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screens/splashScreen.dart';

import './providers/image_provider.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Images())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper App',
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
            // accentColor: Colors.amber,
            fontFamily: "Raleway",
            iconTheme: IconThemeData(color: Colors.purple),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xff457b9d),
              // splashColor: Colors.blueAccent,
              foregroundColor: Colors.black,
            )),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Raleway",
          iconTheme: IconThemeData(color: Colors.black),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xff457b9d),
              foregroundColor: Colors.white),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
