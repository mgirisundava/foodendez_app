import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/res/images.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/textstyles.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EventWidget();
  }
}

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // LAYER 1

            buildBackground(),

            // LAYER 2

            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        'FOODENDEZ',
                        style: poppinsBold24White,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    buildEventSection(),
                    const SizedBox(
                      height: 40,
                    ),
                    buildBackButton(context),
                    const SizedBox(
                      height: 40,
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
            )
          ],
        ),
      ),
    );
  }
}

Widget buildBackButton(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: COLORS.blue,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        shape: const StadiumBorder(),
      ),
      child: Text(
        'Kembali',
        style: poppinsMedium18Black,
      ),
    ),
  );
}

Widget buildEventSection() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    width: double.infinity,
    height: 400,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Acara',
          style: poppinsSemiBold18White,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        const Spacer(),
        Center(
          child: Text(
            'Belum ada acara',
            style: poppinsRegular16White,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    ),
  );
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
