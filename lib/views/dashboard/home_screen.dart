// ignore_for_file: deprecated_member_use

import 'package:aromize_app/controller/product_controller.dart';
import 'package:aromize_app/models/product.dart';
import 'package:aromize_app/views/dashboard/product_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aromize_app/controller/dashboard/home_screen_controller.dart';
import 'package:aromize_app/widgets/custom/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  final c = Get.put(HomeScreenController());
  final productController = Get.put(ProductController());
  HomeScreen({super.key});

  // Category data for the slider
  final List<Map<String, dynamic>> perfumeCategories = [
    {
      'name': 'Designer',
      'color': const Color.fromARGB(255, 6, 102, 211),
      'image': 'assets/logo.png', // Local asset
    },
    {
      'name': 'Arab',
      'color': const Color.fromARGB(255, 0, 196, 153),
      'image': 'assets/common/afnan.png', // Local asset
    },
    {
      'name': 'Niche',
      'color': Colors.purple[800]!,
      'image': 'assets/common/erba.jpg', // Local asset
    },
    {
      'name': 'Clone',
      'color': const Color.fromARGB(255, 255, 239, 100),
      'image': 'assets/clone_perfume.jpg', // Local asset
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover Scents",
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.tune, size: 24),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomTextField(
                    hint: "Search perfumes...",
                    textInputAction: TextInputAction.search,
                    textInputType: TextInputType.text,
                    preIconPath: Icons.search,
                    preIconSize: 30,
                    fillColor: const Color.fromARGB(255, 245, 244, 244),
                    borderColor: Colors.transparent,
                    borderRadius: 1,
                  ),
                ),
                const SizedBox(height: 30),

                // Category Slider - Using CarouselSlider
                CarouselSlider(
                  options: CarouselOptions(
                    height: size.width * 0.7,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.96,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 9),
                  ),
                  items: perfumeCategories.map((category) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: category['color'],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Background image with gradient overlay
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  category['image'],
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                              // Category name
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    category['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),

                // Rest of the code remains the same...
                // Promo Banner
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1615634262417-98ba8a7f8c3a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 51, 54, 52)
                            .withOpacity(0.2),
                        blurRadius: 1,
                        spreadRadius: 0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              const Color.fromARGB(255, 78, 35, 3)
                                  .withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Exclusive Collection",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Limited Edition Scents",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Featured Products Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Perfumes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Obx(
                  () => (productController.loading.value)
                      ? Center(child: CircularProgressIndicator())
                      : productController.allProductsList.isEmpty
                          ? Text("No Products")
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.56,
                              ),
                              itemCount:
                                  productController.allProductsList.length,
                              itemBuilder: (context, index) {
                                final GetProduct product =
                                    productController.allProductsList[index];
                                return GestureDetector(
                                  onTap: () {
                                    // Change 'ProductDetailPage()' to your desired destination page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                products: product,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          16), // Increased radius
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 20,
                                          spreadRadius: 2,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    16), // Increased radius
                                                topRight: Radius.circular(
                                                    16), // Increased radius
                                              ),
                                              child: CachedNetworkImage(
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                height: 200,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                imageUrl: product.image ?? "",
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.network(
                                                  "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                                                  width: double.infinity,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              16.0), // Increased padding
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${product.name}",
                                                style: TextStyle(
                                                  fontSize:
                                                      18, // Increased size
                                                  fontWeight:
                                                      FontWeight.w700, // Bolder
                                                  color: Colors.black,
                                                  letterSpacing:
                                                      -0.2, // Tighter letter spacing
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                "${product.categoryName}",
                                                style: TextStyle(
                                                  color: Colors
                                                      .grey[700], // Darker gray
                                                  fontSize:
                                                      13, // Slightly larger
                                                  fontWeight: FontWeight
                                                      .w500, // Medium weight
                                                  letterSpacing: 0.2,
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "NPR.${product.price}",
                                                    style: TextStyle(
                                                      fontSize:
                                                          18, // Increased size
                                                      fontWeight: FontWeight
                                                          .w800, // Extra bold
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.star,
                                                          size: 18,
                                                          color: Colors.amber[
                                                              700]), // Darker amber
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        "${product.averageRating}",
                                                        style: TextStyle(
                                                          fontSize:
                                                              14, // Increased size
                                                          fontWeight: FontWeight
                                                              .w700, // Bold
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                )
                // Product Grid
              ],
            ),
          ),
        ),
      ),
    );
  }
}
