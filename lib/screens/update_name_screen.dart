import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/textform_field_widget.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update your name",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Text(
              "Please enter your name as it appears on your ID or Passport",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.grey.shade700),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            TextFormFieldWidget(
              labelText: "First name",
              controller: firstNameController,
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            TextFormFieldWidget(
              labelText: "Last name",
              controller: lastNameController,
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.04,
            ),
            ElevateButton(
              text: "Update",
              bgColor: AppColors.primary,
              fgColor: AppColors.white,
              width: double.infinity,
              onpressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
