import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/controller/provider/AppState.dart';
import 'package:live_streaming/screens/PlayList/createPlayList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel(),
    )
  ],
    child:  MyApp()));
}

// Global ValueNotifiers for theme colors
ValueNotifier<Color> appThemeColor = ValueNotifier(AppColor.primary);
ValueNotifier<Color> appBarThemeColor =
    ValueNotifier(AppColor.primaryTransparent);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: appThemeColor,
      builder: (context, bodyColor, child) {
        return ValueListenableBuilder<Color>(
          valueListenable: appBarThemeColor,
          builder: (context, appBarColor, child) {
            return MaterialApp(
              title: 'MR.XTv',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: bodyColor, // Body background color
                  textTheme: GoogleFonts.robotoTextTheme(),
                  appBarTheme: AppBarTheme(
                    backgroundColor: appBarColor, // AppBar background color
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: appBarColor,
                  ),
                  drawerTheme: DrawerThemeData(
                    backgroundColor: bodyColor,
                  )),
              home: CreatePlayListScreen(), // Replace with your initial screen
            );
          },
        );
      },
    );
  }
}
