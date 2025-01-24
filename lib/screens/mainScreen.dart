import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/controller/provider/AppState.dart';
import 'package:live_streaming/screens/Home/home.dart';
import 'package:live_streaming/screens/LiveTv/liveTv.dart';
import 'package:live_streaming/screens/Movies/Movies.dart';
import 'package:live_streaming/screens/Series/Series.dart';
import 'package:live_streaming/screens/widgets/VideoPage.dart';
import 'package:live_streaming/screens/widgets/myBottomBar.dart';
import 'package:live_streaming/screens/widgets/myDrawer.dart';
import 'package:provider/provider.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int selectedItem = 0;
late OverlayEntry overlayEntry;
  final List<Widget> _pages = [
    Home(),
    Movies(),
    Series(),
    LiveTv()
  ];


  void _onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    overlayEntry = OverlayEntry(builder: (context) {
      return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: context.watch<AppStateModel>().isVideoMinimized
              ? (Navigator.of(context).canPop()
                  ? MediaQuery.of(context).padding.bottom
                  : (50 + MediaQuery.of(context).padding.bottom))
              : 0,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            reverseDuration: Duration(milliseconds: 50),
            child: !context.watch<AppStateModel>().isVideoStarted
                ? Container()
                : VideoPage(
                    videoUrl:
                        context.watch<AppStateModel>().activeVideoListItem!.url,
                        videoName: "",
                  ),
          ));
    });
    if (!context.read<AppStateModel>().isOverlayPlayerAdded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _insertOverlay(context);
        context.read<AppStateModel>().setIsOverlayPlayerAdded(true);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: _pages[selectedItem], // Display the selected page
      bottomNavigationBar: MyBottomBar(
        selectedIndex: selectedItem,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _insertOverlay(BuildContext context) {
    context.read<AppStateModel>().addToOverlayEntry(overlayEntry: overlayEntry);
    return Overlay.of(context)!.insert(
      overlayEntry,
    );
  }
}
