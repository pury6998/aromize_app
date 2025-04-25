import 'package:aromize_app/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailController extends GetxController {
  final RxInt currentImageIndex = 0.obs;
  final RxInt userRating = 0.obs;
  final RxBool isFavorite = false.obs;
  final RxInt quantity = 1.obs;
  final CarouselController carouselController = CarouselController();
  final autoSlideInterval = const Duration(seconds: 3);
  final autoSlideCurve = Curves.easeInOut;

  void toggleFavorite() => isFavorite.toggle();
  void setRating(int rating) => userRating.value = rating;
  void incrementQuantity() => quantity.value++;
  void decrementQuantity() =>
      quantity.value = quantity.value > 1 ? quantity.value - 1 : 1;
}

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.products});
  final controller = Get.put(ProductDetailController());
  final GetProduct products;

  final List<String> productImages = [
    'https://images.unsplash.com/photo-1594035910387-fea47794261f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'https://images.unsplash.com/photo-1615634262417-98ba8a7f8c3a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'https://images.unsplash.com/photo-1528740561666-dc2479dc08ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageCarousel(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductHeader(context),
                        const SizedBox(height: 12),
                        _buildRatingDisplay(context),
                        const SizedBox(height: 24),
                        _buildDescriptionSection(context),
                        const SizedBox(height: 24),
                        _buildReviewsSection(context, products.reviews),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildBottomActionBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: products.image ?? "",
              errorWidget: (context, url, error) => Image.network(
                "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Obx(() => Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.currentImageIndex.value,
                  count: productImages.length,
                  effect: const WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white54,
                    spacing: 4,
                  ),
                ),
              )),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.2),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          products.name ?? '',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "NPR. ${products.price}",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
        ),
      ],
    );
  }

  Widget _buildRatingDisplay(BuildContext context) {
    return Row(
      children: [
        Text(
          "Average Rating (${products.averageRating})",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600], fontSize: 16),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.amber, size: 20),
      ],
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
        const SizedBox(height: 8),
        Text(
          products.description ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildReviewsSection(BuildContext context, List<Reviews>? reviews) {
    final RxBool showReviewForm = false.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reviews",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 10),
        if (reviews != null && reviews.isNotEmpty)
          Column(
            children: reviews.map((review) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(review.userName ?? 'Anonymous',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(review.createdAt ?? 'Unknown Date',
                                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 16,
                              color: index < (review.rate ?? 0) ? Colors.amber : Colors.grey[300],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(review.comment ?? 'No comment available.', style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        else
          Center(
            child: Text("No reviews available.", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
          ),
        Obx(
          () => showReviewForm.value
              ? _buildReviewForm(context, showReviewForm)
              : Center(
                  child: ElevatedButton(
                    onPressed: () => showReviewForm.value = true,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Add Your Review", style: TextStyle(color: Colors.white)),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildReviewForm(BuildContext context, RxBool showReviewForm) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add your review", style: Theme.of(context).textTheme.titleSmall),
                IconButton(icon: const Icon(Icons.close), onPressed: () => showReviewForm.value = false),
              ],
            ),
            const SizedBox(height: 12),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => controller.setRating(index + 1),
                      child: Icon(
                        index < controller.userRating.value ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 32,
                      ),
                    );
                  }),
                )),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Share your experience...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => showReviewForm.value = false,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 109, 249, 87),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Submit Review",
                  style: TextStyle(color: Color.fromARGB(255, 17, 16, 16), fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Obx(() => IconButton(
                  onPressed: controller.toggleFavorite,
                  icon: Icon(
                    controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                    color: controller.isFavorite.value ? Colors.red : Colors.black87,
                    size: 28,
                  ),
                )),
            const SizedBox(width: 8),
            Obx(() => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: controller.decrementQuantity,
                        icon: const Icon(Icons.remove, size: 20),
                      ),
                      Text(
                        controller.quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: controller.incrementQuantity,
                        icon: const Icon(Icons.add, size: 20),
                      ),
                    ],
                  ),
                )),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}