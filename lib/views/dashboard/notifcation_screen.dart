import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showNotificationOptions(context),
          ),
        ],
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: 10,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, index) => _NotificationItem(
                isRead: index % 3 == 0,
                isNew: index < 3,
                type: index % 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    const filters = ['All', 'Newest', 'Unread', 'Promotions', 'Orders'];

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) => ChoiceChip(
          label: Text(filters[index],
              style: TextStyle(
                color: index == 0 ? Colors.white : Colors.black87,
              )),
          selected: index == 0,
          onSelected: (_) {},
          selectedColor: Colors.black,
          backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  void _showNotificationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.mark_as_unread),
            title: const Text('Mark all as read'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Clear all notifications'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Notification settings'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final bool isRead;
  final bool isNew;
  final int type;

  const _NotificationItem({
    required this.isRead,
    required this.isNew,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isRead ? Colors.white : Colors.grey[50],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _colors[type].withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _icons[type],
              color: _colors[type],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(_titles[type],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    if (isNew)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "NEW",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _messages[type],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const _colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  static const _icons = [
    Icons.local_offer_outlined,
    Icons.shopping_bag_outlined,
    Icons.notifications_none,
    Icons.account_circle_outlined,
    Icons.payment_outlined,
  ];

  static const _titles = [
    'Special Offer',
    'Order Update',
    'New Arrival',
    'Account Alert',
    'Payment Received',
  ];

  static const _messages = [
    'Get 20% off on your next purchase with code AROMIZE20',
    'Your order #12345 has been shipped',
    'New perfumes added to our collection',
    'Your password was changed successfully',
    'Payment of \$129.99 for order #12345 has been received',
  ];

  static String get _time =>
      DateFormat('h:mm a • MMM d').format(DateTime.now());
}
