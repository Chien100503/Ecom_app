import 'package:ecom_app/data/repositories/banner/repository_banners.dart';
import 'package:ecom_app/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loader.dart';

class BannerController extends GetxController {

  final isLoad = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchBanner();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanner() async {
    try {
      //Loader
      isLoad.value = true;

      final bannerRepo = Get.put(RepositoryBanners());
      final banners = await bannerRepo.fetchBanner();

      this.banners.assignAll(banners);

    } catch (e) {
      // EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh snap', message: e.toString());
    } finally {
      isLoad.value = false;
    }
  }

}