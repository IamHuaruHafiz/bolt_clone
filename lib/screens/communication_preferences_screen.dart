import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/partner_offers_screen.dart';
import 'package:rydeme/screens/promotion_and_tips_screen.dart';
import 'package:rydeme/screens/rydeme_products_screen.dart';
import 'package:rydeme/screens/suggestions_screen.dart';
import 'package:rydeme/screens/travelling_screen.dart';

class CommunicationPrefScreen extends StatelessWidget {
  const CommunicationPrefScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Communication preferences",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Promotions & Tips"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PromotionTipsScreen()));
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("RydeMe Products"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProductsScreen()));
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Travelling"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TravelScreen()));
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Partner Offers"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PartnerOffersScreen()));
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Suggestions"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SuggestionsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
