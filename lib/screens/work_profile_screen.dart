import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/screens/add_company_details_screen.dart';
import 'package:rydeme/screens/choose_payment_method_screen.dart';

class WorkProfileScreen extends StatelessWidget {
  const WorkProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey.shade300,
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Work profile",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: SizeConfig.screenheight! * 0.02),
                    ListTile(
                      leading: const Icon(
                        Icons.work_outline_outlined,
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Add company details"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey.shade600,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const AddCompanyDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.mail_outline_outlined,
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Work email",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey.shade600,
                            ),
                      ),
                      subtitle: Text(
                        "huaruhafiz19@gmail.com",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.black,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey.shade600,
                      ),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.mail_outline_outlined,
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Payment method",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey.shade600,
                            ),
                      ),
                      subtitle: Text(
                        "Cash",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.black,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey.shade600,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PaymentMethodScreen(),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 6),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: Column(children: [
                  ListTile(
                    leading: const Icon(
                      Icons.insert_chart_outlined_outlined,
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Reports"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey.shade600,
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.mail_outline_outlined,
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Add expense provider"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey.shade600,
                    ),
                    onTap: () {},
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
