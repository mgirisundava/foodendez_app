import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/res/images.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/textstyles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AboutWidget();
  }
}

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
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
                    buildProfileSection(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildMarketStrategySection(),
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
            ),
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

Widget buildMarketStrategySection() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Strategi Pasar',
          style: poppinsSemiBold18White,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Upaya yang dilakukan dalam melakukan strategi pasar antara lain :\n\na. Bekerja sama dengan outlet baik tradisional ataupun modern market.\nb. Membuka link pertemenan sehingga memberikan info tentang produk.\nc. Mengikuti pelatihan yang diberikan oleh pihak terkait, baik swasta ataupun pemerintah\nd. Aktif di sosial media yang memberikan info tentang produk\ne. Mengikuti event/pameran yang diselenggarakan pihak swasta ataupun pihak dinas terkait\n\nPihak yang sudah bekerjasama dengan FOODENDEZ untuk pemasaran :\n\na. Borma Cinunuk\nb. Borma Majalaya\nc. Toko Oleh-Oleh Kunafe\nd. Kerabat Store Bandung',
          style: poppinsRegular16White,
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}

Widget buildProfileSection() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profil',
          style: poppinsSemiBold18White,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'FOODENDEZ adalah brand dari kegiatan usaha saya. Ikan biasanya di kenal dengan makanan untuk lauk sebagai teman nasi, namun kini saya ingin mengembangkan kembali dengan cara mengolah ikan ini menjadi makanan yang menarik, sehingga ikan dapat dikenal lebih luas oleh masyarakat. Cara saya memperkenalkan ikan ini secara luas yaitu dengan cara membuat hasil olahan dari ikan yang semenarik mungkin tanpa mengurangi isi nutrisi yang terkandung di dalamnya. Ikan banyak sekali mengandung nutrisi penting bagi kesehatan, kandungan yang termasuk dalam ikan yaitu : Vitamin A, D, B6, B12, Mineral, Protein, bahkan Omega 3 & DHA adalah nutrisi yg paling dominan di dalam ikan, sehingga makanan ini dapat di konsumsi oleh semua kalangan, mulai dari anak-anak hingga orang lanjut usia. FOODENDEZ juga menguluarkan produk berupa Kurcok atau disebut juga Kurma Cokelat, yang merupakan kurma kualitas terbaik yang diisi dengan berbagai varian rasa di dalamnya. Kemudian dilapisi oleh cokelat premium yang menjadikan perpaduan manis kurma dengan lezatnya cokelat dan kejutan rasa unik yang terdapat di dalamnya menyatu lumer pada saat dimakan.',
          style: poppinsRegular16White,
          textAlign: TextAlign.start,
        ),
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
