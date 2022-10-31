import 'package:flutter/material.dart';
import 'package:foodendez_app/core/consts/router.dart';
import 'package:foodendez_app/core/res/images.dart';
import 'package:foodendez_app/core/styles/textstyles.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductsWidget();
  }
}

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  // LIST PRODUCT

  List<Map<String, dynamic>> products = [
    {
      'title': 'Uthi Mies Crunchy Kulit Patin',
      'image': IMAGES.product1,
      'desc':
          'Produk Uthi Mies Juga Produksi Dari FOODENDEZ Yang Merupakan Olahan Dari Ikan Yaitu Ikan Patin. Kalau Di Basreng Yang Dipergunakan Adalah Daging Ikan, Maka Untuk Uthi Mies Yang Dipergunakan Bahan Bakunya Dari Kulit Ikanya. Mulai Dari Mendapatkan Kualitas Ikan Yang Segar Hingga Proses Pengeringan Dan Pengolahanya Membuat Cita Rasa Uthi Mies Menjadi Crunchy Dan Sangat Cocok Dijadikan Cemilan Atau Lauk Yang Biasa Dikomsumsi Oleh Semua Lapisan Masyrakat Dan Untuk Usia Berapapun. Uthi Mies Mengluarkan Variant Rasa Yang Unik Mengikuti Selera Pasar Yaitu : Original, Pedas, Balado, Dan Keju. Kini Dikeluarkan Juga Produk Terbaru Dari Uthi Mies Dengan Varian Yang Kekinian Yaitu Rasa Salted Egg.',
      'price': '40.000',
      'variant': [
        {
          'title': 'Uthi & Mies Krispi Kulit Ikan Patun (Tumbler)',
          'image': IMAGES.krispiKulitIkanPatinTumbler,
          'price': '50.000'
        },
        {
          'title': 'Uthi & Mies Krispi Kulit Ikan Patun (Standing Pouch)',
          'image': IMAGES.krispiKulitIkanPatinStandingPouch,
          'price': '30.000'
        },
      ],
    },
    {
      'title': 'Batirtu74 Kurcok (Kurma Cokelat)',
      'image': IMAGES.product2,
      'desc':
          'FOODENDEZ Juga Mengeluarkan Produk Berupa Kurcok Atau Disebut Juga Batirtu74 Kurcok (Kurma Cokelat), Yang Merupakan Kurma Kualitas Terbaik Yang Diisi Dengan Berbagai Varian Rasa Di Dalamnya Kemudian Dilapisi Oleh Cokelat Premium Yang Menjadikan Perpaduan Manis Kurma Dengan Lezatnya Coklat Dan Kejutan Rasa Unik Yang Terdapat Di Dalamnya Menyatu Lumer Pada Saat Dimakan. Variant Batirtu74 Kurcok (Kurma Coklat) Yang Diproduksi Oleh FOODENDEZ Adalah Kurcok Durian, Strawberry, Blueberry, Mangga, Coklat, Kacang Mede Dan Keju. Dijamin Semua Rasa Merupakan Kegemaran Dan Favorit Semua Orang. Selain Itu Masyrakat Juga Sangat Mengetahui Mengkomsumsi Secara Rutin Kurma Sangat Baik Untuk Kesehatan.',
      'price': null,
      'variant': [],
    },
    {
      'title': 'Basreng Gaul',
      'image': IMAGES.product3,
      'desc':
          'Hampir Sama Dengan Basreng Endez Untuk Bahan Baku Dan Cara Pembuatan Tetapi Yang Membedakanya Dari Variantnya Dan Ukuran Serta Kemasanya. Variant Pada Basreng Gaul Adalah Pedas Biasa, Original Dan Jagung Bakar. Untuk Ukuran Di basreng Gaul Mempunyai Ukuran 125 Gram Sementara Di Basreng Endez 100 Gram. Untuk Kemasan Basreng Gaul Mempunyai Bentuk Kardus Sementara Untuk Basreng Endez Kemasan Jualnya Berbentuk Standingpouch.',
      'price': null,
      'variant': [],
    },
    {
      'title': 'Basreng Endez',
      'image': IMAGES.product4,
      'desc':
          'Basreng Merupakan Cemilan Yang Sanggat Digemari Oleh Masyrakat Terutama Masyrakat Tanah Jawa Barat Bahkan Basreng Identik Menjadi Oleh-Oleh Dari Bandung. Basreng Adalah Olahan Yang Berbahan Baku Dari Ikan Tuna Yang Berkualitas Yang Dicampurkan Oleh Tepung Tapioka Dan Bumbu Rempah Lainnya Yang Gurih Dan Bikin Nagih. Basreng Dari FOODENDEZ Mempunyai 4 Variant Yang Kekinian Disesuaikan Dengan Selera Pasar, Variantnya Yaitu : Keju, Balado, Super Pedas Dan Barbeque.',
      'price': null,
      'variant': [],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Image.asset(IMAGES.logo),
        ),
        body: Stack(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: products
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ROUTER.productDetail,
                              arguments: {
                                'title': e['title'],
                                'image': e['image'],
                                'desc': e['desc'],
                                'price': e['price'],
                                'variant': e['variant'],
                              }); // PASS DATA TO PRODUCT DETAIL PAGE
                        },
                        child: Column(
                          children: [
                            e['price'] == null
                                ? Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Image.asset(
                                          e['image'] ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(10),
                                          ),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Image.asset(
                                              e['image'] ?? '',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: double.infinity,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            child: Text(
                                              'Rp. ${e['price'] ?? ''}',
                                              style:
                                                  poppinsMedium14Black.copyWith(
                                                      color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  e['title'] ?? '',
                                  style: poppinsMedium14Black,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
