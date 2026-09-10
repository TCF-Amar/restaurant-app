import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  static const Color purple = Color(0xFF673AB7);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
      children: [
        const Text(
          'Help & Support',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'How can we help you today?',
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: purple,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              Icon(Icons.headset_mic, color: Colors.white, size: 30),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Live Support',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Available 24/7 — We are here for you',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Frequently Asked Questions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _faqItem(
          'How do I make a payment?',
          'Go to the Payment tab, select your preferred payment method, enter the amount and confirm.',
        ),
        _faqItem(
          'How do I add funds to my wallet?',
          'Tap on your balance on the Payment page and select "Add Funds". Choose your funding source.',
        ),
        _faqItem(
          'Is my data secure?',
          'Yes! We use 256-bit SSL encryption to protect all your transactions and personal data.',
        ),
        _faqItem(
          'How do I apply a promo code?',
          'During payment checkout, tap "Apply Promo Code" and enter your code to get the discount.',
        ),
        _faqItem(
          'How do I contact support?',
          'You can reach us 24/7 via email at support@adanpay.com or call 1-800-ADAN-PAY.',
        ),
        _faqItem(
          'Can I cancel a payment?',
          'Payments can be cancelled within 10 minutes of initiation. Go to Recent Payments and tap Cancel.',
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _contactCard(
                Icons.email,
                'Email Us',
                'support@adanpay.com',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _contactCard(Icons.phone, 'Call Us', '1-800-ADAN-PAY'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _faqItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      iconColor: purple,
      collapsedIconColor: Colors.grey,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(
            answer,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _contactCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: purple.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: purple.withAlpha(60)),
      ),
      child: Column(
        children: [
          Icon(icon, color: purple, size: 26),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: purple,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
