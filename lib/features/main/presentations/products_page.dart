import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodendez_app/core/consts/router.dart';
import 'package:foodendez_app/core/res/images.dart';
import 'package:foodendez_app/core/styles/textstyles.dart';
import 'package:foodendez_app/features/intro/presentations/intro_page.dart';

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
  List<Map<String, dynamic>> products = [
    {
      'title': 'Krispi Kulit Ikan Patin ( SALTED EGG )',
      'image':
          'https://lh6.googleusercontent.com/mHRuIbVRCCrWlvxN13FVSwupZwcDuz_ZR1ae42NQqCfSO2Knf_8iSZggr1XSkXYFgdGUlNJLYHRdjBHeuBsG81kPVPOOJOMOx-v-xgKwX9NLB0HhsvAz5M87CAIHb4yL=w1280',
    },
    {
      'title': 'Krispi Kulit Ikan Patin',
      'image':
          'https://lh5.googleusercontent.com/jOaJK1vINTnOCrmfEPImjcXrTw9o3XgMlLQ-H0iDwktasdED-eCP-mx8qyIE8ZQfTLn1SU7QDDMw35gLIu3pCg0aih0wz0iT7DUy7DEmRMjEVd61XCF3D3sCqsoWVwCz=w1280',
    }
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
                                });
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Image.network(
                                      e['image'] ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['title'] ?? '',
                                      style: poppinsMedium14Black,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
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
          )),
    );
  }
}
