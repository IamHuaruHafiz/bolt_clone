import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/textform_field_widget.dart';

class UpdateEmailScreen extends StatelessWidget {
  const UpdateEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update your email",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            TextFormFieldWidget(
              controller: controller,
              showTrailIcon: true,
              isFilled: false,
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Text(
              "We will send an email to your new address to confirm the change.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey.shade800,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            ElevateButton(
              text: "Send Email",
              bgColor: AppColors.primary,
              fgColor: AppColors.white,
              width: double.infinity,
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
