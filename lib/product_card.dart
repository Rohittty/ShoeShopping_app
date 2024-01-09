import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String imageUrl;
  final Color productBg;
  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required this.productBg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: productBg,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productName,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$ $productPrice",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  )),
              Image(
                  height: 175,
                  image: AssetImage(
                    imageUrl,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
