import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_sec_test/Provider/Home_Provider.dart';
import 'package:noviindus_sec_test/View/Screens/UploadScreen.dart';
import 'package:noviindus_sec_test/View/Widgets/Video_Widget..dart';
import 'package:provider/provider.dart';

import '../../Constants/AppURLs.dart';
import '../../Utils/Appcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final provider = Provider.of<HomeProvider>(context, listen: false);
        provider.getHomeData();
        provider.getCategoryData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => UploadPage());
          },
          backgroundColor: AppColor.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: const Icon(
            Icons.add,
            size: 40,
            color: AppColor.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) => Column(
              children: [
                // Header Sec
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name
                          Text(
                            "Hello Amal",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //description
                          Text(
                            "Welcome back to section",
                            style: TextStyle(
                              color: AppColor.lightgrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(AppUrl.profile),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //Category

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: provider.category.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          provider.onCategoryindexchanged(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColor.grey,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              provider.category[index].title,
                              style: const TextStyle(
                                color: AppColor.white,
                                fontSize: 14,
                              ),
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Home feed

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.home.length,
                  itemBuilder: (context, index) {
                    var home = provider.home[index];
                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        color: AppColor.lightblack,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(70.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 100,
                                      backgroundImage:
                                          NetworkImage(AppUrl.profile),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          home.user.name,
                                          style: const TextStyle(
                                            color: AppColor.grey,
                                            fontSize: 80,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        //description
                                        Text(
                                          formatter.format(home.createdAt),
                                          style: const TextStyle(
                                            color: AppColor.lightgrey,
                                            fontSize: 40,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Image.network(AppUrl.profile),
                              Padding(
                                padding: const EdgeInsets.all(70.0),
                                child: Text(
                                  home.description,
                                  style: const TextStyle(
                                    color: AppColor.lightgrey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
