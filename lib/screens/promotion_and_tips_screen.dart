import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';

class PromotionTipsScreen extends StatelessWidget {
  const PromotionTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Promotions & Tips",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            Text(
              "Receive useful tips and special discounts!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey.shade600,
                    fontSize: 18,
                  ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Email"),
              trailing: Switch(value: true, onChanged: (bool? value) {}),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Push"),
              trailing: Switch(value: true, onChanged: (bool? value) {}),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("SMS"),
              trailing: Switch(value: true, onChanged: (bool? value) {}),
            ),
          ],
        ),
      ),
    );
  }
}
