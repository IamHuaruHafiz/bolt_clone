import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
              "About RydeMe",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            Text(
              "Version CA.119.0",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey.shade600,
                  ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Rate the app"),
              leading: Icon(
                Icons.star_border_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Like us on Facebook"),
              leading: Icon(
                Icons.thumb_up_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Solutions for work rides"),
              leading: Icon(
                Icons.work_outline_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Carreers at RydeMe"),
              leading: Icon(
                Icons.favorite_outline_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Legal"),
              leading: Icon(
                Icons.gavel_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Acknowledgements"),
              leading: Icon(
                Icons.drafts_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Privacy"),
              leading: Icon(
                Icons.drafts_outlined,
                color: AppColors.grey.shade600,
              ),
              onTap: () {},
            ),
            const Spacer(),
            Center(
              child: Text(
                "Made with ❤️ in KNUST",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.grey.shade600,
                    ),
              ),
            ),
          ]),
        ));
  }
}
