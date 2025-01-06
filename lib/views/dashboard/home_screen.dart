import 'package:aromize_app/controller/dashboard/home_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/image_path.dart';
import 'package:aromize_app/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  final c = Get.put(HomeScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Good Morning 👋",
                                      style: CustomTextStyles.f18W600(),
                                    ),
                                    Text(
                                      "Emily Johnson",
                                      style: CustomTextStyles.f14W400(),
                                    ),
                                  ]),
                              Container(
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage(ImagePath.blankProfile),
                                        fit: BoxFit.cover)),
                              )
                            ]),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: c.searchController,
                          hint: "Search..",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                          preIconPath: Icons.search,
                          preIconSize: 22,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Categories",
                          style: CustomTextStyles.f14W600(),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryWidget(
                                categoryName: "Dog",
                                categoryImage: ImagePath.dog),
                            CategoryWidget(
                                categoryName: "Cat",
                                categoryImage: ImagePath.cat),
                            CategoryWidget(
                                categoryName: "Rabbit",
                                categoryImage: ImagePath.rabbit),
                            CategoryWidget(
                                categoryName: "Bird",
                                categoryImage: ImagePath.bird),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Doctors",
                          style: CustomTextStyles.f14W600(),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                }
                return const DoctorWidget();
              })),
    );
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        margin: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
        height: 119,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(blurRadius: 2, color: AppColors.secondaryColor)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 100,
              width: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Emily Johnson",
                    style: CustomTextStyles.f14W600(),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(
                        ImagePath.star,
                        color: AppColors.secondaryTextColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.location),
                      const SizedBox(width: 4),
                      Text(
                        "Chauthe, Pokhara",
                        style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 160,
                    child: Text(
                      "fdsf aehfjsd fadifj adfk do gadgdv v ffg",
                      style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });
  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 72,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          const SizedBox(height: 4),
          Image.asset(categoryImage),
          Text(categoryName, style: CustomTextStyles.f12W400())
        ],
      ),
    );
  }
}
