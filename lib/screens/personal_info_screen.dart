import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/profile_details_screen.dart';
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
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Image(
                            image: AssetImage("assets/images/person.png"),
                            fit: BoxFit.fill,
                          )),
                      const Positioned(
                        left: 25,
                        bottom: 25,
                        child: Badgee(
                          backgroundColor: AppColors.primary,
                          alignment: Alignment.center,
                          label: Icon(Icons.add_outlined),
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
