import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodendez_app/core/consts/router.dart';
import 'package:foodendez_app/core/styles/colors.dart';
import 'package:foodendez_app/core/styles/textstyles.dart';

import '../../../core/res/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeWidget();
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
                    height: 40,
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
                        Navigator.pushNamed(context, ROUTER.about);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLORS.blue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        'Tentang',
                        style: poppinsMedium18Black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ROUTER.products);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLORS.blue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        'Produk',
                        style: poppinsMedium18Black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ROUTER.event);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: COLORS.blue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        'Acara',
                        style: poppinsMedium18Black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Contact Person',
                          style: poppinsRegular16White,
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          'Bara (+62 858-6378-1357)',
                          style: poppinsRegular16White,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 05.0, sigmaY: 05.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
      ),
    ],
  );
}
