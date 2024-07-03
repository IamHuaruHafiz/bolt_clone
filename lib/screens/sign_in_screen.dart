import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/provider/auth_provider.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/social_auth_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();
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
            IntlPhoneField(
              dropdownIconPosition: IconPosition.trailing,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'GH',
              onChanged: (phone) {
                print(phone.completeNumber);
                numberController.text = phone.completeNumber;
              },
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevateButton(
                    width: double.infinity,
                    text: "Sign in",
                    onpressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      print("Number:" + numberController.text);
                      Provider.of<AuthProvider>(context, listen: false)
                          .verifyPhoneNumber(context, "+233200848237")
                          .then((_) {
                        setState(() {
                          _isLoading = false;
                        });
                      }).catchError((_) {
                        setState(() {
                          _isLoading = false;
                        });
                      });
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
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                return authProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SocialAuthButton(
                        imageString: "google.png",
                        text: "Sign in with Google",
                        width: double.infinity,
                        onpressed: () {
                          authProvider.signInWithGoogle(context);
                        },
                      );
              },
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
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
