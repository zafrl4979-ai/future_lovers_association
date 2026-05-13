import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة المدير العام'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _buildCard(
              title: 'إضافة وكيل',
              icon: Icons.person_add,
              color: AppColors.primary,
              onTap: () {},
            ),
            _buildCard(
              title: 'إضافة مساهم',
              icon: Icons.group_add,
              color: Colors.green,
              onTap: () {},
            ),
            _buildCard(
              title: 'إضافة مدير صندوق',
              icon: Icons.account_balance_wallet,
              color: AppColors.gold,
              onTap: () {},
            ),
            _buildCard(
              title: 'المستخدمون',
              icon: Icons.people,
              color: Colors.orange,
              onTap: () {},
            ),
            _buildCard(
              title: 'الإشعارات',
              icon: Icons.notifications,
              color: Colors.purple,
              onTap: () {},
            ),
            _buildCard(
              title: 'الشكاوى',
              icon: Icons.support_agent,
              color: Colors.teal,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
