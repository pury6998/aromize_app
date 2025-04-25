import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aromize_app/controller/dashboard/cart_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/widgets/custom/elevated_button.dart';

class MyCartScreen extends StatelessWidget {
  static String routeName = "/my-cart-screen";
  final MyCartScreenController c = Get.put(MyCartScreenController());

  MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "My Cart (${c.cartItems.length})", // Dynamically display cart item count
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _clearCart(),
            child: Text(
              "Delete All",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.all(20),
                itemCount: c.cartItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                  int productId = c.cartItems.keys.toList()[index];
                  return _buildCartItem(productId);
                },
              ),
            ),
          ),
          _buildCheckoutBar(),
        ],
      ),
    );
  }

  // Cart item UI
  Widget _buildCartItem(int productId) {
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          // Selection Checkbox
          Obx(() => Checkbox(
                value: c.selectedItems[productId]?.value ?? false,
                onChanged: (bool? value) {
                  c.toggleSelection(productId);
                },
                shape: CircleBorder(),
                activeColor: AppColors.primaryColor,
              )),
          SizedBox(width: 12),

          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1594035910387-fea47794261f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Noir Essence Eau de Parfum",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "100ml Bottle",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$129.99", // Replace with dynamic price
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    _buildQuantitySelector(productId),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Quantity selector UI
  Widget _buildQuantitySelector(int productId) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove, size: 18),
            onPressed: () => c.decrement(productId),
            padding: EdgeInsets.zero,
          ),
          Obx(() => Text(
                '${c.cartItems[productId]?.value ?? 0}',
                style: TextStyle(fontSize: 16),
              )),
          IconButton(
            icon: Icon(Icons.add, size: 18),
            onPressed: () => c.increment(productId),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  // Checkout bar UI
  Widget _buildCheckoutBar() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          // Select All Checkbox
          Obx(() => Checkbox(
                value: c.isSelectedAll.value,
                onChanged: (bool? value) {
                  c.toggleSelectionAll();
                },
                shape: CircleBorder(),
                activeColor: AppColors.primaryColor,
              )),
          Text("Select All", style: TextStyle(fontSize: 14)),
          Spacer(),

          // Price Summary
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() {
                double total = c.cartItems.values
                    .map((e) => e.value * 129.99) // Replace with dynamic price
                    .fold(0.0, (sum, item) => sum + item);
                return Text(
                  "Total: \$${total.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }),
              Text(
                "Free Delivery",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(width: 16),

          // Checkout Button
          SizedBox(
            width: 120,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CustomElevatedButton(
                title: "Checkout",
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Clear cart logic
  void _clearCart() {
    c.cartItems.clear();
    c.selectedItems.clear();
  }
}
