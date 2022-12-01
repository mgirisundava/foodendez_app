// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodendez_app/core/consts/router.dart';
import 'package:foodendez_app/core/styles/colors.dart';
import 'package:foodendez_app/core/styles/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

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
  _launchURL() async {
    const url = 'https://wa.me/6285863781357';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green.shade800,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Konfirmasi'),
                        content: const Text(
                            'Apakah kamu yakin ingin menghubungi kami?'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('TIDAK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('YA'),
                            onPressed: () {
                              _launchURL();
                            },
                          ),
                        ],
                      ));
            },
            child: const FaIcon(FontAwesomeIcons.whatsapp)),
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
