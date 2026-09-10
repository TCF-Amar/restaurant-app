import 'package:flutter/material.dart';

class PromosPage extends StatelessWidget {
  const PromosPage({super.key});

  static const Color purple = Color(0xFF673AB7);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
      children: [
        const Text(
          'Active Promos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Exclusive deals just for you',
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
        const SizedBox(height: 16),
        _promoCard(
          '50% OFF',
          'On first payment',
          'Use code: FIRST50',
          Colors.orange,
          Icons.local_offer,
        ),
        const SizedBox(height: 12),
        _promoCard(
          'Free Transfer',
          'No fees this weekend',
          'Valid: Sat & Sun only',
          Colors.green,
          Icons.send,
        ),
        const SizedBox(height: 12),
        _promoCard(
          r'Cashback 10%',
          'On all utility bills',
          r'Min. $50 payment required',
          purple,
          Icons.account_balance_wallet,
        ),
        const SizedBox(height: 12),
        _promoCard(
          r'Refer & Earn $5',
          'Get rewarded per referral',
          'Unlimited referrals allowed',
          Colors.teal,
          Icons.people,
        ),
        const SizedBox(height: 12),
        _promoCard(
          'Zero Commission',
          'On international transfers',
          'This month only',
          Colors.indigo,
          Icons.public,
        ),
      ],
    );
  }

  Widget _promoCard(
      String title, String subtitle, String note, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 36),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(note,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
