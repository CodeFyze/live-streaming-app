import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/screens/AccountInfo/accountInfo.dart';
import 'package:live_streaming/screens/Home/home.dart';
import 'package:live_streaming/screens/Movies/Movies.dart';
import 'package:live_streaming/screens/PlayList/createPlayList.dart';
import 'package:live_streaming/screens/PlayList/myPlaylist.dart';
import 'package:live_streaming/screens/Series/Series.dart';
import 'package:live_streaming/screens/mainScreen.dart';

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
      scaffoldBackgroundColor: AppColor.primary,
              textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: CreatePlayListScreen(),
    );
  }
}

