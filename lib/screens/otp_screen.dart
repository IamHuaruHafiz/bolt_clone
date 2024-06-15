import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/home_screen.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/otp_box.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });
  final String verificationId;
  final String phoneNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();
  bool isLoading = false;

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
              widget.phoneNumber, // Replace with actual phone number if needed
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
                  last: false,
                  controller: controller4,
                ),
                OTPBox(
                  first: false,
                  last: false,
                  controller: controller5,
                ),
                OTPBox(
                  first: false,
                  last: true,
                  controller: controller6,
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
                  text: "10s", // Implement countdown timer here if needed
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ))
            ])),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevateButton(
                    text: "Verify",
                    bgColor: AppColors.primary,
                    fgColor: AppColors.black,
                    width: double.infinity,
                    onpressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String otpText = controller1.text +
                          controller2.text +
                          controller3.text +
                          controller4.text +
                          controller5.text +
                          controller6.text;
                      final smsCode = otpText.trim();

                      if (smsCode.isNotEmpty) {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: smsCode,
                          );
                          await FirebaseAuth.instance
                              .signInWithCredential(credential);

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to sign in: ${e.toString()}'), // Provide more user-friendly error message if needed
                            ),
                          );
                        }
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
