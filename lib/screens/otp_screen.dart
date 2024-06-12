import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/home_screen.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/otp_box.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the code",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Text(
              "An SMS code was sent to",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.01,
            ),
            Text(
              "+233508401057",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OTPBox(
                  first: true,
                  last: false,
                  controller: controller1,
                ),
                OTPBox(
                  first: false,
                  last: false,
                  controller: controller2,
                ),
                OTPBox(
                  first: false,
                  last: false,
                  controller: controller3,
                ),
                OTPBox(
                  first: false,
                  last: true,
                  controller: controller4,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.01,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Resend code in",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      )),
              TextSpan(
                  text: "10s",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ))
            ])),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            ElevateButton(
              text: "Verify",
              bgColor: AppColors.primary,
              fgColor: AppColors.black,
              width: double.infinity,
              onpressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
