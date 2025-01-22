
import 'package:flutter/material.dart';

class LayoutOption extends StatelessWidget {
  final VoidCallback onTap;

  const LayoutOption({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Row(children: [
            Container(
              width: 70,
              height: 30,
            color: Colors.black,
            ),
         SizedBox(width: 8,),
          Container(
              width: 70,
              height: 30,
            color: Colors.black,
            )
          
          ],),
        SizedBox(height: 5,),
        Row(children: [
            Container(
             width: 70,
              height: 30,
            color: Colors.black,
            ),
         SizedBox(width: 8,),
          Container(
              width: 70,
              height: 30,
            color: Colors.black,
            )
          
          ],)
       
        ],)
      ),
    );
  }
}

class TwoScreen extends StatelessWidget {
  final VoidCallback onTap;

  const TwoScreen({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
              width: 140,
              height: 30,
            color: Colors.black,
            ),
        SizedBox(height: 5,),
        Container(
             width: 140,
              height: 30,
            color: Colors.black,
            ),
         
       
        ],)
      ),
    );
  }
}

class ThreeScreen extends StatelessWidget {
  final VoidCallback onTap;

  const ThreeScreen({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
              width: 70,
              height: 70,
            color: Colors.black,
            ),
        SizedBox(width: 5,),
        Column(children: [
            Container(
             width: 70,
              height: 30,
            color: Colors.black,
            ),
         SizedBox(height: 8,),
          Container(
              width: 70,
              height: 30,
            color: Colors.black,
            )
          
          ],)
       
        ],)
      ),
    );
  }
}

class TwoVerticalScreen extends StatelessWidget {
  final VoidCallback onTap;

  const TwoVerticalScreen({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
              width: 71.5,
              height: 65,
            color: Colors.black,
            ),
        SizedBox(width: 5,),
        Container(
             width: 71.5,
              height: 65,
            color: Colors.black,
            ),
         
       
        ],)
      ),
    );
  }
}

class FourVerticalScreen extends StatelessWidget {
  final VoidCallback onTap;

  const FourVerticalScreen({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            Container(
              width: 145,
              height: 30,
            color: Colors.black,
            ),
         
        SizedBox(height: 5,),
        Row(children: [
            Container(
             width: 43,
              height: 30,
            color: Colors.black,
            ),
         SizedBox(width: 8,),
          Container(
              width: 43,
              height: 30,
            color: Colors.black,
            ),
             SizedBox(width: 8,),
          Container(
              width: 43,
              height: 30,
            color: Colors.black,
            )
          
          ],)
       
        ],)
      ),
    );
  }
}
