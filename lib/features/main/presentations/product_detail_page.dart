import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/res/images.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/textstyles.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productData = ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>; // GET DATA FROM PRODUCTS PAGE

    return ProductDetailWidget(productData: productData);
  }
}

class ProductDetailWidget extends StatefulWidget {
  final Map<String, dynamic>? productData;

  const ProductDetailWidget({Key? key, this.productData}) : super(key: key);

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
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
                    buildProductDetailSection(widget),
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

Widget buildProductDetailSection(widget) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Produk :',
        style: poppinsSemiBold18White,
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        widget.productData?['title'] ?? '',
        style: poppinsRegular16White,
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 10,
      ),
      widget.productData?['price'] == null
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harga :',
                  style: poppinsSemiBold18White,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Rp. ${widget.productData?['price'] ?? ''}',
                  style: poppinsRegular16White,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
      Text(
        'Tentang :',
        style: poppinsSemiBold18White,
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        widget.productData?['desc'] ?? '',
        style: poppinsRegular16White,
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 20,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          widget.productData?['image'] ?? '',
        ),
      ),
      widget.productData['variant'].isEmpty
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Variant',
                  style: poppinsSemiBold18White,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productData?['variant'].length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: index == 0 ? 0 : 15),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        widget.productData?['variant'][index]
                                            ['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        widget.productData?['variant'][index]
                                            ['title'],
                                        style: poppinsRegular16White.copyWith(
                                            fontSize: 12),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Rp. ${widget.productData?['variant'][index]['price']}',
                                      style: poppinsSemiBold18White.copyWith(
                                          fontSize: 12),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                ),
              ],
            ),
      const SizedBox(
        height: 15,
      ),
    ]),
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
