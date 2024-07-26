import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/features/shop/controllers/product/order_controller.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/loader/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/images_strings.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrder(),
      builder: (_, snapshot) {
        final emptyWidget = EAnimationLoader(
          text: 'Whoops! Wishlist is empty...',
          animation: EImages.loaderAnimationOne,
          showAction: true,
          actionText: 'Let\'s add some',
          actionButtonAnimation: () => Get.off(
                () => const NavigationMenu(),
          ),
        );
        final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        final orders = snapshot.data!;

        return ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: ESizes.defaultBetweenItem,
          ),
          itemCount: orders.length,
          itemBuilder: (_, index) {
            final order = orders[index];
            return ERoundContainer(
              padding: const EdgeInsets.all(ESizes.md),
              showBorder: true,
              bg: dark ? EColors.accent : EColors.thirdColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(width: ESizes.defaultBetweenItem / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  color: Colors.blueAccent, fontWeightDelta: 2),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.arrow_right_34,
                          color: dark ? EColors.thirdColor : EColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: ESizes.defaultBetweenItem),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(width: ESizes.defaultBetweenItem / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  order.id,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar_1),
                            const SizedBox(width: ESizes.defaultBetweenItem / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Shipping date',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    order.formattedOrderDeliveryDate,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        );
      }
    );
  }
}
