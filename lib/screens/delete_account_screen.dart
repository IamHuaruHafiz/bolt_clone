import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/widgets/elevated_button.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delete account",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: SizeConfig.screenheight! * 0.02),
              Text(
                "We're really sorry to see you go 🥲 Are you sure you want to delete your account? Once you confirm, your data will be gone.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.grey.shade600,
                      fontSize: 18,
                    ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text("I am no longer using my account"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text("The service is too expensive"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text("I want to change my phone number"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text("I don't understand how to use the service"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text("The service is not available in my city"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text("Other"),
                onTap: () {},
              ),
              const Spacer(),
              ElevateButton(
                text: "Confirm",
                bgColor: AppColors.red,
                fgColor: AppColors.white,
                width: double.infinity,
                onpressed: () {},
              )
            ],
          ),
        ));
  }
}
