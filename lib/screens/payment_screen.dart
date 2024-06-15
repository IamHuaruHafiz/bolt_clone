import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: SizeConfig.screenheight! * 0.02),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.grey.shade100,
                        ),
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("RydeMe balance",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: AppColors.grey.shade500,
                                      )),
                              Text("GH₵ 0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.grey.shade600,
                                      )),
                              const Divider(),
                              Text(
                                  "RydeMe balance is not available with this payment method",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith()),
                            ])),
                    ListTile(
                      leading: const Icon(Icons.question_mark_outlined),
                      title: const Text("What is RydeMe balance?"),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.schedule_outlined,
                      ),
                      title: const Text("See RydeMe balance transactions"),
                      onTap: () {},
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment methods",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: SizeConfig.screenheight! * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 1,
                                          color: AppColors.grey.shade400),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: AppColors.grey.shade400),
                                      left: BorderSide(
                                          width: 1,
                                          color: AppColors.grey.shade400),
                                    ),
                                    color: AppColors.primary,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        bottomLeft: Radius.circular(24))),
                                child: Text(
                                  "Personal",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 1,
                                          color: AppColors.grey.shade400),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: AppColors.grey.shade400),
                                      right: BorderSide(
                                          width: 1,
                                          color: AppColors.grey.shade400),
                                    ),
                                    color: AppColors.white,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(24),
                                        bottomRight: Radius.circular(24))),
                                child: const Text("Work"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.payments_outlined),
                        title: const Text("Cash"),
                        trailing: Radio(
                            value: true,
                            groupValue: true,
                            onChanged: (bool? bool) {}),
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.add_outlined),
                        title: const Text("Add debit/credit card  "),
                        onTap: () {},
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}
