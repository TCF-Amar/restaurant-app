import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const Color purple = Color(0xFF673AB7);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
      children: [
        const Text(
          'Current balance',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
        const SizedBox(height: 8),
        const Text(
          r'$2,450.00',
          style: TextStyle(
            color: purple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 22),
        _paymentCard(),
        const SizedBox(height: 24),
        const Text(
          'Recent payments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _paymentTile('Electricity bill', r'$85.00', Icons.bolt),
        _paymentTile('Internet subscription', r'$49.99', Icons.wifi),
        _paymentTile('Mobile recharge', r'$20.00', Icons.phone_android),
        _paymentTile('Water bill', r'$32.00', Icons.water_drop),
        _paymentTile('Gas bill', r'$55.00', Icons.local_fire_department),
      ],
    );
  }

  Widget _paymentCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: purple,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.account_balance_wallet, color: Colors.white, size: 30),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              'Make a payment\nFast and secure payments',
              style: TextStyle(
                color: Colors.white,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    );
  }

  Widget _paymentTile(String title, String amount, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: purple.withAlpha(25),
        child: Icon(icon, color: purple, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
