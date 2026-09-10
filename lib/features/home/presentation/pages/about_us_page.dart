import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  static const Color purple = Color(0xFF673AB7);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
      children: [
        Center(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: purple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.payment, color: Colors.white, size: 44),
              ),
              const SizedBox(height: 12),
              const Text(
                'AdanPay',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: purple),
              ),
              const Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'About Us',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'AdanPay is a fast, secure, and easy-to-use digital payment platform designed to simplify your financial transactions. We believe in making payments accessible to everyone, everywhere.',
          style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 20),
        const Text(
          'Our Mission',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'To provide seamless, secure, and inclusive digital payment solutions that empower individuals and businesses globally.',
          style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _statCard('5M+', 'Users'),
            const SizedBox(width: 10),
            _statCard('100+', 'Countries'),
            const SizedBox(width: 10),
            _statCard('99.9%', 'Uptime'),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Contact',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _infoTile(Icons.email, 'Email', 'contact@adanpay.com'),
        _infoTile(Icons.web, 'Website', 'www.adanpay.com'),
        _infoTile(Icons.location_on, 'Address', '123 Finance St, New York, USA'),
        _infoTile(Icons.phone, 'Phone', '1-800-ADAN-PAY'),
      ],
    );
  }

  Widget _statCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: purple.withAlpha(20),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: purple.withAlpha(60)),
        ),
        child: Column(
          children: [
            Text(value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: purple)),
            Text(label,
                style: const TextStyle(color: Colors.black54, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: purple.withAlpha(25),
        child: Icon(icon, color: purple, size: 20),
      ),
      title: Text(label,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
              fontSize: 12)),
      subtitle:
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
