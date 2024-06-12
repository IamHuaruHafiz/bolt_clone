import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/widgets/elevated_button.dart';
import 'package:rydeme/widgets/textform_field_widget.dart';

class UpdateNumberScreen extends StatelessWidget {
  const UpdateNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update phone number",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Text(
              "We'll send a code for verification",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey.shade700,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Row(
              children: [
                const CountryCodePicker(
                  showDropDownButton: true,
                  onChanged: print,
                  initialSelection: 'GH',
                  favorite: ['+39', 'FR'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                ),
                Expanded(
                  child: TextFormFieldWidget(
                    controller: numberController,
                    showTrailIcon: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.message_outlined),
              title: Text(
                "Use SMS",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
              trailing: Radio(
                  value: true, groupValue: true, onChanged: (bool? value) {}),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.message_outlined),
              title: Text(
                "Use WhatsApp",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
              trailing: Radio(
                  value: true, groupValue: true, onChanged: (bool? value) {}),
            ),
            Spacer(),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Text(
              "RydeMe will not send anything without your consent.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey.shade600,
                  ),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            ElevateButton(
              text: "Continue",
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
