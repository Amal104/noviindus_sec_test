import 'package:flutter/material.dart';
import 'package:noviindus_sec_test/Services/Category_Services.dart';
import 'package:noviindus_sec_test/Services/Home_Services.dart';

import '../Model/Category_model.dart';
import '../Model/Home_Model.dart';

class HomeProvider extends ChangeNotifier {
  List<Result> home = [];
  List<Categories> category = [];
  var isLoading = false;

  int cntCatindex = 0;

  onCategoryindexchanged(int index) {
    cntCatindex = index;
    notifyListeners();
  }

  getHomeData() async {
    isLoading = true;
    notifyListeners();

    home = (await HomeServices().getHome());

    isLoading = false;
    notifyListeners();
  }

  getCategoryData() async {
    isLoading = true;
    notifyListeners();

    category = (await CategoryServices().getCategory());

    isLoading = false;
    notifyListeners();
  }
}
