import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';

class ScreenHeadingBarWidget extends StatefulWidget {
  String title;
  String moviesCount;
  String subtitle;
  ScreenHeadingBarWidget({required this.title,  required this.moviesCount ,required this.subtitle, super.key});

  @override
  State<ScreenHeadingBarWidget> createState() => _ScreenHeadingBarWidgetState();
}

class _ScreenHeadingBarWidgetState extends State<ScreenHeadingBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.moviesCount,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}