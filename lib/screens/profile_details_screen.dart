import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/personal_info_screen.dart';
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.person_outline_outlined),
                    title: const Text("Personal info")),
                const Divider(),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.verified_user_outlined),
                    title: const Text("Login & Security")),
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
                    onTap: () {},
                    leading: const Icon(Icons.home_outlined),
                    title: const Text("Enter home location")),
                const Divider(),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.work_outline_outlined),
                    title: const Text("Enter work lation")),
                const Divider(),
                ListTile(
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
                  onTap: () {},
                  leading: const Icon(Icons.language_outlined),
                  title: const Text("Language"),
                  subtitle: const Text("English - USA"),
                ),
                const Divider(),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.campaign_outlined),
                    title: const Text("Communication preferences")),
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
                  onTap: () async {
                    await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Log Out?"),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevateButton(
                                  text: "Log out",
                                  bgColor: AppColors.primary,
                                  fgColor: AppColors.white,
                                  width: double.infinity,
                                  onpressed: () {},
                                ),
                                SizedBox(
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
                    onTap: () {},
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
  final Alignment alignment;

  const Badgee({
    Key? key,
    required this.backgroundColor,
    required this.label,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: 25,
      width: 25,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: label,
    );
  }
}
