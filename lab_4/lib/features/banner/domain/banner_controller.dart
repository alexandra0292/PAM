import 'package:get/get.dart';

import '../../../models/banner.dart';
import '../data/banner_data.dart';

class BannerController extends GetxController {
  final BannerData bannerData;
  var banner = Banner().obs;

  BannerController(this.bannerData);

  @override
  void onInit() {
    super.onInit();
    fetchBanner();
  }

  Future<void> fetchBanner() async {
    try {
      banner.value = await bannerData.fetchBanner();
    } catch (e) {
      print("Error fetching banner: $e");
    }
  }
}