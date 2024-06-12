import 'package:flutter/material.dart';
import 'package:rydeme/widgets/textform_field_widget.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController languageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Language",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextFormFieldWidget(
                controller: languageController,
                hintText: "Search for a country")
          ],
        ),
      ),
    );
  }
}
