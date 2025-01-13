import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/Home/home.dart';
import 'package:live_streaming/screens/PlayList/createPlayList.dart';
import 'package:live_streaming/screens/PlayList/myPlaylist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MR.XTv',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
       // primarySwatch: Colors.deepPurple,
              textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: CreatePlayListScreen(),
    );
  }
}

