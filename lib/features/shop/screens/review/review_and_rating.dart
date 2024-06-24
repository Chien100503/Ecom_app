import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/features/shop/screens/review/widget/admin_reply_review.dart';
import 'package:ecom_app/features/shop/screens/review/widget/overall_rating.dart';
import 'package:ecom_app/features/shop/screens/review/widget/rating_bar_star.dart';
import 'package:ecom_app/features/shop/screens/review/widget/user_review_card.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReviewAndRating extends StatelessWidget {
  const ReviewAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'Review & Rating',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Verified reviews and ratings from and come from users who use your category',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: ESizes.defaultBetweenItem),
              const EOverallRating(),
              const ERatingStar(rating: 4.5),
              const SizedBox(height: ESizes.defaultBetweenSections),
              const UserReviewCard(),
              const SizedBox(height: ESizes.defaultBetweenItem),
              const EAdminReplyReview(),
              const SizedBox(height: ESizes.defaultBetweenSections),
              const UserReviewCard(),
              const SizedBox(height: ESizes.defaultBetweenItem),
              const EAdminReplyReview()
            ],
          ),
        ),
      ),
    );
  }
}
