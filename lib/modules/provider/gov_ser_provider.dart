import 'package:flutter/material.dart';
import 'package:government_services_app/modules/model/gov_model.dart';
import 'package:government_services_app/modules/utils.dart';

class GovSerProvider extends ChangeNotifier {
  List<GovModel> govSerlist = [];

  getData() {
    govSerlist = govListData.map((e) {
      return GovModel(name: e['name'], img: e['img'], link: e['link']);
    }).toList();
    notifyListeners();
  }
}
