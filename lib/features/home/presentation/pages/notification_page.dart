import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const Color purple = Color(0xFF673AB7);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Mark all read',
                  style: TextStyle(color: purple, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _notificationTile(
          Icons.payment,
          'Payment Successful',
          r'Your payment of $85.00 was successful.',
          '2 mins ago',
          true,
        ),
        _notificationTile(
          Icons.local_offer,
          'New Promo Available',
          'Get 50% off on your next payment!',
          '1 hour ago',
          true,
        ),
        _notificationTile(
          Icons.security,
          'Security Alert',
          'New login detected from a new device.',
          '3 hours ago',
          false,
        ),
        _notificationTile(
          Icons.account_balance_wallet,
          'Funds Added',
          r'$500 has been added to your wallet.',
          'Yesterday',
          false,
        ),
        _notificationTile(
          Icons.receipt,
          'Bill Reminder',
          'Your electricity bill is due tomorrow.',
          '2 days ago',
          false,
        ),
        _notificationTile(
          Icons.card_giftcard,
          'Promo Expiring Soon',
          'Your FIRST50 promo expires in 2 days.',
          '3 days ago',
          false,
        ),
      ],
    );
  }

  Widget _notificationTile(
    IconData icon,
    String title,
    String subtitle,
    String time,
    bool isNew,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isNew ? purple.withAlpha(20) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isNew ? purple.withAlpha(80) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: isNew ? purple : Colors.grey.shade300,
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isNew ? purple : Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Text(time,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
          if (isNew)
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 4, left: 6),
              decoration: const BoxDecoration(
                color: purple,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
