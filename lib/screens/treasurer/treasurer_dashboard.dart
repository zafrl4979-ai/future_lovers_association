import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

class TreasurerDashboard extends StatelessWidget {
  const TreasurerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة مدير الصندوق'),
        subtitle: Text('${AppConstants.treasurerName} - ${AppConstants.treasurerPhone}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'رصيد الصندوق',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '100,000 ريال',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'الحد الأدنى للسداد: 500 ريال',
                    style: TextStyle(color: AppColors.gold, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.2,
              children: [
                _buildCard(
                  title: 'الوكلاء',
                  icon: Icons.business,
                  color: Colors.blue,
                  onTap: () {},
                ),
                _buildCard(
                  title: 'المساهمين',
                  icon: Icons.people,
                  color: Colors.green,
                  onTap: () {},
                ),
                _buildCard(
                  title: 'تسديد لوكيل',
                  icon: Icons.payments,
                  color: AppColors.gold,
                  onTap: () {
                    _showPaymentDialog(context, 'وكيل');
                  },
                ),
                _buildCard(
                  title: 'تسديد لمساهم',
                  icon: Icons.account_balance_wallet,
                  color: AppColors.primary,
                  onTap: () {
                    _showPaymentDialog(context, 'مساهم');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, String type) {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('تسديد لـ $type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('الرجاء إدخال المبلغ'),
            const SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'المبلغ بالريال',
              ),
            ),
            if (type == 'مساهم')
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'الحد الأدنى: 500 ريال',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text);
              if (amount == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('رجاء إدخال مبلغ صحيح')),
                );
                return;
              }
              if (type == 'مساهم' && amount < AppConstants.minPayment) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('الحد الأدنى للسداد للمساهم هو ${AppConstants.minPayment} ريال')),
                );
                return;
              }
              Navigator.pop(context);
              _showReceiptDialog(context, amount);
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }

  void _showReceiptDialog(BuildContext context, double amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تم السداد بنجاح'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('المبلغ: $amount ريال'),
            const SizedBox(height: 10),
            Text('مدير الصندوق: ${AppConstants.treasurerName}'),
            Text('رقم الجوال: ${AppConstants.treasurerPhone}'),
            const Divider(),
            const Text('سيتم إنشاء سند PDF', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
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
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
