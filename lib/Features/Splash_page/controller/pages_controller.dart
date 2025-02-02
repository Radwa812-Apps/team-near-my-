import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  final RxInt page = 0.obs;

  final LiquidController controller = LiquidController();

  void onPageChangeCallback(int activePageIndex) {
    page.value = activePageIndex;
  }

  void skip() {
    if (controller != null) {
      controller.jumpToPage(page: 2);
    }
  }

  void animateToNextSlid() {
    if (controller != null) {
      int nextPage = controller.currentPage + 1;
      if (nextPage < 3) {
        controller.animateToPage(page: nextPage, duration: 100);
      }
    }
  }
}
