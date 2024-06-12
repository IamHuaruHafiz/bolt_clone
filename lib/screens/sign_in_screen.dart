import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/otp_screen.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/social_auth_button.dart';
import 'package:rydeme/widgets/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your number",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.01),
            const TextFieldWidget(),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            ElevateButton(
              width: double.infinity,
              text: "Sign in",
              onpressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OTPScreen()));
              },
              bgColor: AppColors.primary,
              fgColor: AppColors.white,
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Divider(
                    height: 2,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    height: 2,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            SocialAuthButton(
              imageString: "google.png",
              text: "Sign in with Google",
              width: double.infinity,
              onpressed: () {},
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            SocialAuthButton(
              imageString: "facebook.png",
              text: "Sign in with Facebook",
              width: double.infinity,
              onpressed: () {},
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.1),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "By signing up you agree with our ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                          )),
                  TextSpan(
                      text: "Terms & Conditions, ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                      text: "acknowlegde our ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                          )),
                  TextSpan(
                      text: "Privacy Policy,",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                      text: " and confirm that you're over 18 years.",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                          )),
                ]))
          ],
        ),
      ),
    );
  }
}
