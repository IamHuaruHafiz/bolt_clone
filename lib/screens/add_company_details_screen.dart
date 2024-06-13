import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/textform_field_widget.dart';

class AddCompanyDetailsScreen extends StatelessWidget {
  const AddCompanyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController companyNameController = TextEditingController();
    TextEditingController companyAddressController = TextEditingController();
    TextEditingController vatNumberController = TextEditingController();
    TextEditingController registrationNumberController =
        TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Add company info",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            TextFormFieldWidget(
              controller: companyNameController,
              labelText: "Company name",
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            TextFormFieldWidget(
              controller: companyAddressController,
              labelText: "Company address",
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            TextFormFieldWidget(
              controller: vatNumberController,
              labelText: "VAT number",
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            TextFormFieldWidget(
              controller: registrationNumberController,
              labelText: "Registration number",
            ),
            SizedBox(height: SizeConfig.screenheight! * 0.02),
            ElevateButton(
              text: "Save",
              bgColor: AppColors.primary,
              fgColor: AppColors.white,
              width: double.infinity,
              onpressed: () {},
            )
          ]),
        ));
  }
}
