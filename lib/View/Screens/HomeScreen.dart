import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noviindus_sec_test/Utils/Appcolor.dart';
import 'package:noviindus_sec_test/Utils/Const_Strings.dart';

import '../../Utils/Size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width(context) * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header

            SizedBox(
              height: height(context) * 0.15,
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
                color: AppColor.grey,
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
                  height: height(context) * 0.06,
                  width: width(context) * 0.15,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: width(context) * 0.04,
                ),
                Container(
                  height: height(context) * 0.06,
                  width: width(context) * 0.66,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.grey,
                    ),
                  ),
                  child: TextField(
                    
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
