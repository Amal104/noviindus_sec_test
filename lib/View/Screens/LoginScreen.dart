import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noviindus_sec_test/Provider/Login_Provider.dart';
import 'package:noviindus_sec_test/Utils/Appcolor.dart';
import 'package:noviindus_sec_test/Utils/Const_Strings.dart';
import 'package:noviindus_sec_test/View/Screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/Size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final provider = Provider.of<LoginProvider>(context, listen: false);
        provider.tokencheck();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width(context) * 0.06,
        ),
        child: Consumer<LoginProvider>(
          builder: (context, provider, child) => SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header

                    SizedBox(
                      height: height(context) * 0.1,
                    ),

                    const Text(
                      "Enter Your\nMobile Number",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 25,
                      ),
                    ),

                    // Description

                    SizedBox(
                      height: height(context) * 0.015,
                    ),

                    const Text(
                      ConstStrings.loremipsum,
                      maxLines: 2,
                      style: TextStyle(
                        color: AppColor.lightgrey,
                        fontSize: 15,
                      ),
                    ),

                    // Textfied

                    SizedBox(
                      height: height(context) * 0.04,
                    ),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: height(context) * 0.06,
                          // width: width(context) * 0.15,
                          decoration: BoxDecoration(
                            color: AppColor.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColor.grey,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "+91",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: AppColor.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width(context) * 0.035,
                        ),
                        Container(
                          height: height(context) * 0.06,
                          width: width(context) * 0.64,
                          decoration: BoxDecoration(
                            color: AppColor.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColor.grey,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width(context) * 0.03),
                            child: TextField(
                              controller: provider.mobileController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: AppColor.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your Number",
                                hintStyle: TextStyle(
                                  color: AppColor.lightgrey,
                                  fontSize: 12,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: width(context) * 0.85,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    HapticFeedback.lightImpact();
                    await provider.login(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: height(context) * 0.06,
                    //width: width(context) * 0.3,
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: AppColor.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Continue",
                          style: TextStyle(
                            color: AppColor.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: width(context) * 0.03,
                        ),
                        Container(
                          height: height(context) * 0.09,
                          width: width(context) * 0.09,
                          decoration: const BoxDecoration(
                            color: AppColor.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: AppColor.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
