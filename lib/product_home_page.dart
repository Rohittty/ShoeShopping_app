import 'package:flutter/material.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details_page.dart';

import 'global_variables.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  final List<String> filter = const [
    "All",
    "Adidas",
    "Nike",
    "Puma",
  ];
  var filteredList = products;
  late String selectedFilter;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1),
          width: 2,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)));
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Amazon\nShopping",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: TextField(
                      onSubmitted: (value) {
                        String val = value.toString();
                        if (val.isNotEmpty) {
                          final newfilteredList = products
                              .where(
                                (element) =>
                                    (element["company"] as String)
                                        .toLowerCase() ==
                                    val.toLowerCase(),
                              )
                              .toList();
                          filteredList = newfilteredList;
                        } else {
                          filteredList = products;
                          selectedFilter = filter[0];
                        }
                        setState(() {});
                      },
                      controller: textEditingController,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              String val =
                                  textEditingController.text.toString();
                              if (val.isNotEmpty) {
                                final newfilteredList = products
                                    .where(
                                      (element) =>
                                          (element["company"] as String)
                                              .toLowerCase() ==
                                          val.toLowerCase(),
                                    )
                                    .toList();
                                filteredList = newfilteredList;
                              } else {
                                filteredList = products;
                                selectedFilter = filter[0];
                              }
                              // if(filteredList.isNotEmpty){
                              //   selectedFilter =
                              // }
                              setState(() {});
                            },
                            icon: const Icon(Icons.search)),
                        hintText: "Search",
                        focusedBorder: border,
                        enabledBorder: border,
                      ))),
            ],
          ),
          // Filters
          SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filter.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          selectedFilter = filter[index];
                          if (selectedFilter != filter[0]) {
                            final newfilteredList = products
                                .where(
                                  (element) =>
                                      element["company"] == selectedFilter,
                                )
                                .toList();
                            filteredList = newfilteredList;
                          } else {
                            filteredList = products;
                          }
                          setState(() {});
                        },
                        child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: selectedFilter == filter[index]
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 255, 246, 219),
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                filter[index],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            )),
                      ));
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: filteredList.isEmpty
                ? Center(
                    child: Text(
                    "No products found!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
                : ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final data = filteredList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(
                              product: data,
                            );
                          }));
                        },
                        child: ProductCard(
                          productName: data['title'] as String,
                          productPrice: data['price'].toString(),
                          imageUrl: data["imageUrl"] as String,
                          productBg: index.isEven
                              ? const Color.fromARGB(255, 161, 195, 223)
                              : const Color.fromARGB(255, 203, 224, 234),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
