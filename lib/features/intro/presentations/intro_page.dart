import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodendez_app/core/consts/router.dart';
import 'package:foodendez_app/core/styles/colors.dart';
import 'package:foodendez_app/core/styles/textstyles.dart';

import '../../../core/res/images.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IntroWidget();
  }
}

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildBackground(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'FOODENDEZ',
                    style: poppinsBold24White,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, ROUTER.home, (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLORS.blue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        'Masuk',
                        style: poppinsMedium18Black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Versi 0.001',
                      style: poppinsRegular14White,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBackground() {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMAGES.background),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMAGES.background),
          ),
        ),
        // child: BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 05.0, sigmaY: 05.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white.withOpacity(0.0),
        //     ),
        //   ),
        // ),
      ),
    ],
  );
}
