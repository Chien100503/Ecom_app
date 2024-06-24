import 'package:ecom_app/features/shop/screens/review/widget/rating_process_indicator.dart';
import 'package:flutter/material.dart';

class EOverallRating extends StatelessWidget {
  const EOverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 3,
            child: Text('4.6',
                style: TextStyle(
                    fontSize: 50, fontWeight: FontWeight.w600))),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ERatingProcessIndicator(
                value: 0.9,
                text: '5',
              ),
              ERatingProcessIndicator(
                value: 0.7,
                text: '4',
              ),
              ERatingProcessIndicator(
                value: 0.5,
                text: '3',
              ),
              ERatingProcessIndicator(
                value: 0.3,
                text: '2',
              ),
              ERatingProcessIndicator(
                value: 0.1,
                text: '1',
              ),
            ],
          ),
        )
      ],
    );
  }
}