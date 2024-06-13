import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "How can we help?",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            Text(
              "Support cases",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            ),
            ListTile(
              leading: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey.shade300,
                  ),
                  child: const Icon(Icons.message_outlined)),
              contentPadding: EdgeInsets.zero,
              title: const Text("Inbox"),
              subtitle: const Text("View open cahts"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            Text(
              "Get help with something else",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("About RydeMe"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("App and features"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Account and data"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Payments and pricing"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Using RydeMe"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
          ]),
        ));
  }
}
