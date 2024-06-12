import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';

class LoginSecurityScreen extends StatelessWidget {
  const LoginSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.shade200,
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey.shade300),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login & security",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: SizeConfig.screenheight! * 0.02),
                Text(
                  "Passkeys",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: SizeConfig.screenheight! * 0.01),
                TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero)),
                    onPressed: () {},
                    child: Text(
                      "Set up your Passkeys",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.primary,
                          ),
                    )),
                SizedBox(height: SizeConfig.screenheight! * 0.02),
                Text(
                  "Passkeys offer a seamless,highly-secure way to log in with just a touch or glance",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.grey.shade600,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey.shade300),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Other login options",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: SizeConfig.screenheight! * 0.01),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Image(
                      image: AssetImage("assets/images/google.png"),
                      height: 50,
                      width: 50,
                    ),
                    title: const Text("Google"),
                    trailing:
                        TextButton(onPressed: () {}, child: const Text("Link")),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Image(
                      image: AssetImage("assets/images/facebook.png"),
                      height: 50,
                      width: 50,
                    ),
                    title: const Text("Facebook"),
                    trailing:
                        TextButton(onPressed: () {}, child: const Text("Link")),
                  ),
                  SizedBox(height: SizeConfig.screenheight! * 0.01),
                  Text(
                    "Linking a social account allows you to sign in to to  RydeMe without your phone. We'll not use your social account for anything else without your permission.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.grey.shade600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
