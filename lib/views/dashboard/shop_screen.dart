import 'package:aromize_app/controller/dashboard/shop_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShopScreen extends StatelessWidget {
  final c = Get.put(ShopScreenController());
  ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose Category", style: CustomTextStyles.f16W600()),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryWidget(image: ImagePath.food, name: "Foods"),
                    CategoryWidget(
                        image: ImagePath.accessories, name: "Accessory"),
                    CategoryWidget(image: ImagePath.toy, name: "Toys"),
                  ],
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: 8, // Replace with the actual number of products
                  itemBuilder: (context, index) {
                    return const ProductWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: 208,
        width: 153,
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey,
              offset: const Offset(1, 1),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Image.asset(
                ImagePath.product,
                height: 90,
                width: 118,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 3),
              child: Text(
                "Oxbow Simple Rewards Bell Pepper Treats",
                style: CustomTextStyles.f12W600(),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Text(
                    "4.3/5 (48)| 12 Sold",
                    style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "Rs.450",
                style: CustomTextStyles.f12W600(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final c = Get.put(ShopScreenController());
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => c.toggleSelection(name),
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          height: 35,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: c.selectedCategory.value == name
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
            ),
          ),
          child: Row(
            children: [
              Image.asset(image),
              Text(
                name,
                style: CustomTextStyles.f12W400(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
