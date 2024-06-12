import 'package:flutter/material.dart';
import 'package:rydeme/widgets/textform_field_widget.dart';

class WorkLocationScreen extends StatelessWidget {
  const WorkLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormFieldWidget(
                  showTrailIcon: true,
                  trailingIcon: Icons.map,
                  hintText: "Search location",
                  showPrefixIcon: true,
                  prefixIcon: Icons.search,
                  controller: controller),
            )),
        title: Text(
          "Work",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close_outlined,
          ),
        ),
      ),
    );
  }
}
