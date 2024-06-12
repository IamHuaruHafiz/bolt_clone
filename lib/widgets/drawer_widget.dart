import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/about_screen.dart';
import 'package:rydeme/screens/myrides_screen.dart';
import 'package:rydeme/screens/payment_screen.dart';
import 'package:rydeme/screens/profile_details_screen.dart';
import 'package:rydeme/screens/support_screen.dart';
import 'package:rydeme/screens/work_profile_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.grey.shade200,
      shape: const RoundedRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              alignment: Alignment.center,
              height: SizeConfig.screenheight! * 0.15,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileDetailsScreen(),
                    ),
                  );
                },
                leading: const SizedBox(
                    height: 50,
                    width: 50,
                    child:
                        Image(image: AssetImage("assets/images/person.png"))),
                title: const Text("Junior"),
                subtitle: const Text("My account"),
              )),
          SizedBox(
            height: SizeConfig.screenheight! * 0.01,
          ),
          Container(
            height: SizeConfig.screenheight! * 0.45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.wallet_outlined),
                  title: const Text("Payment"),
                ),
                SizedBox(
                  height: SizeConfig.screenheight! * 0.01,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyRidesScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.calendar_view_day_outlined),
                  title: const Text("My Rides"),
                ),
                SizedBox(
                  height: SizeConfig.screenheight! * 0.01,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WorkProfileScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.work_outline_outlined),
                  title: const Text("Work Profile"),
                ),
                SizedBox(
                  height: SizeConfig.screenheight! * 0.01,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SupportScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.help_outline_outlined),
                  title: const Text("Support"),
                ),
                SizedBox(
                  height: SizeConfig.screenheight! * 0.01,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.info_outlined),
                  title: const Text("About"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenheight! * 0.01,
          ),
          Container(
            height: SizeConfig.screenheight! * 0.4,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
