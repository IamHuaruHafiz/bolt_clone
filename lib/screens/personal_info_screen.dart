import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/profile_details_screen.dart';
import 'package:rydeme/screens/take_selfie_screen.dart';
import 'package:rydeme/screens/update_email_screen.dart';
import 'package:rydeme/screens/update_name_screen.dart';
import 'package:rydeme/screens/update_number_screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

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
              "Personal info",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.grey.shade600,
                          backgroundImage: const AssetImage(
                            "assets/images/person.png",
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SelfieScreen(),
                            ),
                          );
                        },
                        child: const Positioned(
                          child: Badgee(
                            backgroundColor: AppColors.primary,
                            label: Icon(
                              Icons.add_outlined,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenheight! * 0.02),
                  Text(
                    "Add a profile photo so drivers can recognise you",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline_outlined),
              title: const Text("Junior Bolt"),
              trailing: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UpdateNameScreen(),
                      ),
                    );
                  },
                  child: const Text("Edit")),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone_iphone_outlined),
              title: const Text("+233508401057"),
              trailing: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UpdateNumberScreen(),
                      ),
                    );
                  },
                  child: const Text("Edit")),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.mail_outlined),
              title: const Text("huaruhafiz19@gmail.com"),
              subtitle: const Text("Not verified"),
              trailing: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UpdateEmailScreen(),
                      ),
                    );
                  },
                  child: const Text("Edit")),
            ),
          ],
        ),
      ),
    );
  }
}
