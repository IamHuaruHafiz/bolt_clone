import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/widgets/elevated_button.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Choose a payment method ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            Text(
              "Choose the default payment method for your work rides. You can always change this later.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey.shade600,
                    fontSize: 18,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            ListTile(
              leading: const Icon(
                Icons.payments_outlined,
              ),
              contentPadding: EdgeInsets.zero,
              title: const Text("Cash"),
              trailing: Radio(
                groupValue: true,
                value: true,
                onChanged: (bool? value) {},
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: const Icon(
                Icons.add_outlined,
              ),
              contentPadding: EdgeInsets.zero,
              title: const Text("Add debit/credit card"),
              onTap: () {},
            ),
            Spacer(),
            ElevateButton(
              text: "Update",
              bgColor: AppColors.primary,
              fgColor: AppColors.white,
              width: double.infinity,
              onpressed: () {},
            )
          ]),
        ));
  }
}
