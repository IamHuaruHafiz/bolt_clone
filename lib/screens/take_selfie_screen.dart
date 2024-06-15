import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';

class SelfieScreen extends StatelessWidget {
  const SelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close_outlined,
              ))
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16.0, bottom: 16.0, top: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: AppColors.grey.shade600),
            ),
            SizedBox(
              height: SizeConfig.screenheight! * 0.02,
            ),
            Text(
              "Avoid places with bad lighting. Place your head inside the circle and smile! ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.flip_camera_android_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.black,
                      ),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.black,
                        ),
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.flash_off_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
