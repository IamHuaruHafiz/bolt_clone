import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/communication_preferences_screen.dart';
import 'package:rydeme/screens/delete_account_screen.dart';
import 'package:rydeme/screens/enter_home_location_screen.dart';
import 'package:rydeme/screens/enter_work_location_screen.dart';
import 'package:rydeme/screens/login_and_security_screen.dart';
import 'package:rydeme/screens/personal_info_screen.dart';
import 'package:rydeme/screens/select_language_screen.dart';
import 'package:rydeme/widgets/elevated_button.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey.shade200,
        appBar: AppBar(),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.grey.shade600,
                    backgroundImage: const AssetImage(
                      "assets/images/person.png",
                    )),
                SizedBox(
                  height: SizeConfig.screenheight! * 0.02,
                ),
                Text(
                  "Junior Bolt",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person_outline_outlined),
                  title: const Text("Personal info"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PersonalInfoScreen(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.verified_user_outlined),
                  title: const Text("Login & Security"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginSecurityScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saved Places",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.home_outlined),
                  title: const Text("Enter home location"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeLocationScreen(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.work_outline_outlined),
                  title: const Text("Enter work Location"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WorkLocationScreen(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    leading: const Icon(Icons.add_outlined),
                    title: const Text("Add a place")),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                )),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.language_outlined),
                  title: const Text("Language"),
                  subtitle: const Text("English - USA"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SelectLanguageScreen(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.campaign_outlined),
                  title: const Text("Communication preferences"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CommunicationPrefScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                )),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () async {
                    await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Log Out?"),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevateButton(
                                  text: "Log out",
                                  bgColor: AppColors.red,
                                  fgColor: AppColors.white,
                                  width: double.infinity,
                                  onpressed: () {},
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ElevateButton(
                                  text: "Back",
                                  bgColor: AppColors.grey.shade300,
                                  fgColor: AppColors.black,
                                  width: double.infinity,
                                  onpressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          );
                        });
                  },
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text("Log out"),
                ),
                const Divider(),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DeleteAccountScreen(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.delete_outline_outlined),
                    title: const Text("Delete account")),
              ],
            ),
          )
        ]));
  }
}

class Badgee extends StatelessWidget {
  final Color backgroundColor;
  final Widget label;

  const Badgee({
    super.key,
    required this.backgroundColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: label),
    );
  }
}
